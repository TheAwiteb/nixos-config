{
  enableKillSwitch,
  ...
}:
{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.enableIPv6 = !enableKillSwitch;
  boot.kernel.sysctl."net.ipv6.conf.wlp0s20f3.disable_ipv6" = enableKillSwitch;
  boot.kernelParams = if enableKillSwitch then [ "ipv6.disable=1" ] else [ ];
}
