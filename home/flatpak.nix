{
  lib,
  pkgs,
  ...
}:
{
  home.activation = {
    hytaleOverrides = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      ${pkgs.flatpak}/bin/flatpak override --user \
      --socket=wayland --nosocket=x11 \
      --nosocket=fallback-x11 --device=all \
      --env=SDL_VIDEODRIVER=wayland \
      --env=__NV_PRIME_RENDER_OFFLOAD=1 \
      --env=__GLX_VENDOR_LIBRARY_NAME=nvidia \
      com.hypixel.HytaleLauncher
    '';
  };
}
