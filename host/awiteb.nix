{
  pkgs,
  ...
}:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.awiteb = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "awiteb";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    packages = [ ];
  };

  programs.gnupg = {
    agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-gnome3;
    };
  };
  services.pcscd.enable = true;

  programs.zsh.enable = true;
  services.flatpak.enable = true;
  xdg.portal = {
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    enable = true;
  };
  virtualisation.docker.enable = true;
  virtualisation.docker.autoPrune.enable = true;
}
