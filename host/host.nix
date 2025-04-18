{
  ...
}:
{
  imports = [
    ./awiteb.nix
    ./hardware-configuration.nix
    ./hardware.nix
    ./network.nix
    ./services
  ];

  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Auto system update
  system.autoUpgrade = {
    enable = true;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-2095201b-e0e7-4de1-b5e2-87e5cffbb772".device =
    "/dev/disk/by-uuid/2095201b-e0e7-4de1-b5e2-87e5cffbb772";

  time.timeZone = "Asia/Riyadh";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  system.stateVersion = "24.11";
}
