{
  ...
}:
{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.enableIPv6 = false;
  boot.kernel.sysctl."net.ipv6.conf.wlp0s20f3.disable_ipv6" = true;
  boot.kernelParams = [ "ipv6.disable=1" ];
}
