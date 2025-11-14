{
  lib,
  secrets,
  ...
}:
let
  splitUniqueJoin =
    idx: list:
    lib.concatStringsSep ", " (
      lib.lists.unique (
        builtins.map (ipPort: builtins.elemAt (lib.strings.splitString ":" ipPort) idx) list
      )
    );

  # Extracts IPs from a list of `ip:port` strings and joins them with ", ".
  vpnIps = splitUniqueJoin 0 secrets.vpnIpsPorts;
  # Extracts ports from a list of `ip:port` strings and joins them with ", ".
  vpnPorts = splitUniqueJoin 1 secrets.vpnIpsPorts;
in
{
  networking.firewall.enable = false;
  networking.nftables.enable = true;
  networking.nftables.flushRuleset = true;

  networking.nftables.ruleset = ''
    table ip filter {
      chain input {
        type filter hook input priority 0; policy drop;

        # Allow loopback traffic (localhost)
        iif "lo" accept

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
}
