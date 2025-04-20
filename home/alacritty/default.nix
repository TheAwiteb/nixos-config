{
  pkgs-unstable,
  ...
}:
{
  programs.alacritty = {
    enable = true;
    package = pkgs-unstable.alacritty;
  };

  programs.alacritty.settings = {
    terminal.shell = "zsh";

    env = {
      TERM = "xterm-256color";
      SHELL = "zsh";
    };

    window = {
      startup_mode = "Fullscreen";
      padding.x = 10;
      padding.y = 10;
      decorations = "None";
      opacity = 0.95;
    };

    font = {
      size = 13;
      normal = {
        family = "UbuntuMono Nerd Font";
        style = "Regular";
      };
    };

    mouse.hide_when_typing = true;
  };
}
