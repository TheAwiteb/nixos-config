{
  pkgs-unstable,
  secrets,
  ...
}:
{
  programs.ssh = {
    enable = true;
    package = pkgs-unstable.openssh;
  };
  programs.ssh.matchBlocks = {
    vps = {
      user = secrets.ssh.vps.user;
      hostname = secrets.ssh.vps.hostname;
      port = secrets.ssh.vps.port;
    };
  };
}
