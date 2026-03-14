{
  ...
}:
{
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    xkb = {
      layout = "us,ara";
      variant = "";
    };
  };
  services.displayManager.defaultSession = "gnome";
}
