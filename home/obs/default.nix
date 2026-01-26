{
  pkgs,
  ...
}:
let
  plugins = pkgs.obs-studio-plugins;
in
{
  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio;
    plugins = with plugins; [
      obs-vaapi
      obs-vkcapture
    ];
  };
}
