{
  pkgs-unstable,
  ...
}:
{
  programs.eza = {
    enable = true;
    package = pkgs-unstable.eza;
    colors = "always";
    git = true;
    enableZshIntegration = true;
  };
}
