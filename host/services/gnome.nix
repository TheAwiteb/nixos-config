{
  pkgs,
  ...
}:
{
  services.desktopManager.gnome.enable = true;
  services.displayManager = {
    gdm.enable = true;
    defaultSession = "gnome";
  };

  environment.gnome.excludePackages = with pkgs; [
    epiphany    # Web Browser
    snapshot    # Camera
    showtime    # GNOME Videos
    decibels    # Audio Player
    simple-scan # Document Scanner
    yelp        # Help viewer
    gnome-software
    gnome-music
  ];
}
