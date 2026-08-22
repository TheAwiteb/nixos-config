{ ... }:
{
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    enableGitIntegration = true;
    shellIntegration = {
      enableZshIntegration = true;
      mode = "no-cursor no-cwd no-title";
    };
  };

  programs.kitty.font = {
    name = "FiraCode Nerd Font";
    size = 13;
  };

  programs.kitty.settings = {
    window_padding_width = 0;
    background_opacity = "0.98";
    confirm_os_window_close = 0;
    hide_window_decorations = "yes";

    mouse_hide_wait = -1;

    tab_bar_min_tabs = 2;
    tab_bar_edge = "bottom";
    tab_bar_style = "powerline";
    tab_powerline_style = "slanted";
    tab_title_template = "{index}";

    enable_audio_bell = "no";
  };

  programs.kitty.keybindings = {
    "ctrl+1" = "goto_tab 1";
    "ctrl+2" = "goto_tab 2";
    "ctrl+3" = "goto_tab 3";
    "ctrl+4" = "goto_tab 4";

    # Zoom
    "ctrl+equal" = "change_font_size all +2.0";
    "ctrl+minus" = "change_font_size all -2.0";
    "ctrl+0" = "change_font_size all 0";
  };
}
