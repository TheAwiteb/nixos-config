{ ... }:
{
  programs.kitty = {
    enable = true;
    themeFile = "Tango_Dark";
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
    confirm_os_window_close = 0;
    hide_window_decorations = "yes";

    mouse_hide_wait = -1;

    tab_bar_min_tabs = 2;
    tab_bar_edge = "bottom";
    tab_bar_style = "powerline";
    tab_powerline_style = "slanted";
    tab_title_template = "{index}";

    enable_audio_bell = "no";

    # Enable splits layout only
    enabled_layouts = "splits";

    # Use Helix as a pager
    scrollback_pager = ''
      sh -c 'sed -E "s/\x1b\][^\x1b]*(\x1b\\\\|\x07)//g; s/\x1b\[[0-9;:?]*[a-zA-Z]//g; /^[[:space:]]*$/d" | hx -'
    '';
  };

  programs.kitty.keybindings = {
    # Tab movements
    "ctrl+1" = "goto_tab 1";
    "ctrl+2" = "goto_tab 2";
    "ctrl+3" = "goto_tab 3";
    "ctrl+4" = "goto_tab 4";
    "ctrl+5" = "goto_tab 5";

    # Zoom
    "ctrl+equal" = "change_font_size all +2.0";
    "ctrl+minus" = "change_font_size all -2.0";
    "ctrl+0" = "change_font_size all 0";

    # Show the pager
    "ctrl+shift+e" = "show_scrollback";

    # Windows (aka panes) moving
    "ctrl+shift+u" = "move_window up";
    "ctrl+shift+d" = "move_window down";
    "ctrl+shift+h" = "move_window left";
    "ctrl+shift+l" = "move_window right";

    # Windows (aka panes) movements
    "ctrl+shift+;" = "neighboring_window up";
    "ctrl+shift+'" = "neighboring_window down";
    "ctrl+shift+[" = "neighboring_window left";
    "ctrl+shift+]" = "neighboring_window right";

    # Horizontal split
    "alt+shift+h" = "launch --location=hsplit --cwd=current";
    # Vertical split
    "alt+shift+v" = "launch --location=vsplit --cwd=current";
  };
}
