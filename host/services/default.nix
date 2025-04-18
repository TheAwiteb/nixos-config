{
  ...
}:
{
  imports = [
    ./tor.nix
    ./xserver.nix
  ];

  # touchpad
  services.libinput.enable = true;
}
