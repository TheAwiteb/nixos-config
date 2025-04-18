{
  pkgs-unstable,
  lib,
  ...
}:
{
  programs.ssh = {
    enable = true;
    package = pkgs-unstable.openssh;
  };
  programs.ssh.matchBlocks = {
    vps = {
      hostname = builtins.readFile ../../secrets/ssh/vps-hostname;
      port = lib.toInt (builtins.readFile ../../secrets/ssh/vps-port);
      user = builtins.readFile ../../secrets/ssh/vps-user;
    };
  };
}
