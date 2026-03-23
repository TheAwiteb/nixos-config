{
  ...
}:
{
  imports = [
    ./tor.nix
    ./gnome.nix
  ];

  # touchpad
  services.libinput.enable = true;
}
