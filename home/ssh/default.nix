{
  pkgs-unstable,
  secrets,
  ...
}:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    package = pkgs-unstable.openssh;
  };

  programs.ssh.settings."vps" = {
    user = secrets.ssh.vps.user;
    hostname = secrets.ssh.vps.hostname;
    port = secrets.ssh.vps.port;
  };

  programs.ssh.settings."*" = {
    forwardAgent = false;
    addKeysToAgent = "no";
    compression = false;
    serverAliveInterval = 0;
    serverAliveCountMax = 3;
    hashKnownHosts = false;
    userKnownHostsFile = "~/.ssh/known_hosts";
    controlMaster = "no";
    controlPath = "~/.ssh/master-%r@%n:%p";
    controlPersist = "no";
  };
}
