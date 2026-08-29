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

  environment.sessionVariables.VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/intel_icd.x86_64.json";
  services.pcscd.enable = true;

  programs.xwayland.enable = true;
  programs.zsh.enable = true;
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
    ];
    config.common.default = [ "gnome" ];
  };
  virtualisation.docker.enable = true;
  virtualisation.docker.autoPrune.enable = true;
}
