{
  lib,
  pkgs,
  secrets,
  ...
}:
let
  splitUniqueJoin =
    idx: list:
    lib.concatStringsSep ", " (
      lib.lists.unique (map (ipPort: builtins.elemAt (lib.strings.splitString ":" ipPort) idx) list)
    );

  # Extracts IPs from a list of `ip:port` strings and joins them with ", ".
  vpnIps = splitUniqueJoin 0 secrets.vpnIpsPorts;
  # Extracts ports from a list of `ip:port` strings and joins them with ", ".
  vpnPorts = splitUniqueJoin 1 secrets.vpnIpsPorts;
  killSwitchRules = ''
    table ip filter {
      chain input {
        type filter hook input priority 0; policy drop;

        # Allow loopback traffic (localhost)
        iif "lo" accept

        # Allow specific LAN subnet
        ip saddr 192.168.1.0/24 accept

        # Accept established and related connections
        ct state { established, related } accept

        # Drop invalid packets
        ct state invalid drop

        # Allow traffic on VPN interfaces
        iifname {"tun*", "wg*"} accept
      }

      chain forward {
        type filter hook forward priority 0; policy drop;
      }

      chain output {
        type filter hook output priority 0; policy drop;

        # Allow loopback traffic (localhost)
        oif "lo" accept

        # Allow specific LAN subnet
        ip daddr 192.168.1.0/24 accept

        # Accept established and related connections (for replies)
        ct state { established, related } accept

        # Allow outgoing connections to VPN servers on specified ports
        ip daddr { ${vpnIps} } tcp dport { ${vpnPorts} } accept
        ip daddr { ${vpnIps} } udp dport { ${vpnPorts} } accept

        # Allow all other traffic ONLY IF it's going out over the VPN interface
        oifname {"tun*", "wg*"} accept
      }
    }
  '';
in
{
  networking.firewall.enable = true;
  networking.nftables.enable = true;
  networking.nftables.flushRuleset = true;

  environment.etc."nftables/killswitch.nft".text = killSwitchRules;

  # Service to apply rules at boot based on persisted state
  systemd.services.apply-killswitch-at-boot = {
    description = "Apply killswitch rules at boot if previously enabled";
    wantedBy = [ "network-pre.target" ];
    after = [ "nftables.service" ];
    serviceConfig.Type = "oneshot";
    script = ''
      if [ -f "/var/lib/killswitch-active" ]; then
        echo "Killswitch was active, re-applying rules..."
        ${pkgs.nftables}/bin/nft -f /etc/nftables/killswitch.nft
      fi
    '';
  };

  # killswitch scripts
  environment.systemPackages = with pkgs; [
    (writeScriptBin "switch-killswitch" ''
      #!/bin/sh
      echo "Switching to killswitch mode..."
      ${pkgs.nftables}/bin/nft -f /etc/nftables/killswitch.nft
      # Mark killswitch as active for persistence
      touch /var/lib/killswitch-active
    '')

    (writeScriptBin "switch-normal" ''
      #!/bin/sh
      echo "Switching to normal mode..."
      ${pkgs.nftables}/bin/nft flush ruleset
      # Remove killswitch marker
      rm -f /var/lib/killswitch-active

    '')

    (writeScriptBin "killswitch-status" ''
      #!/bin/sh
      if [ -f "/var/lib/killswitch-active" ]; then
        echo "Status: KILLSWITCH ACTIVE"
        echo "Firewall: Strict (VPN only)"
      else
        echo "Status: NORMAL MODE"
        echo "Firewall: Normal"
      fi
    '')
  ];
}
