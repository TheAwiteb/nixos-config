{
  ...
}:
{
  programs.helix.settings.keys.normal = {
    # Move line up
    C-k = [
      "extend_to_line_bounds"
      "delete_selection"
      "move_line_up"
      "paste_before"
    ];
    # Move line down
    C-j = [
      "extend_to_line_bounds"
      "delete_selection"
      "paste_after"
    ];
    # Reflow the text
    A-q = [ ":reflow" ];
    # Scroll view up
    C-u = [ "scroll_up" ];
    # Scroll view down
    C-d = [ "scroll_down" ];

    # Cutom commands
    space.space = {
      # Open yazi to manage files
      y = [
        '':insert-output yazi "%{buffer_name}"''
        ":redraw"
        ":reload-all"
      ];
      # Open gitui
      g = [
        ":write-all"
        ":new"
        ":insert-output gitui >/dev/tty"
        ":buffer-close!"
        ":redraw"
        ":reload-all"
      ];
    };

    # Text case changer, by ccase <https://github.com/rutrum/ccase>
    A-c = {
      u = ":pipe ccase -t upper";
      l = ":pipe ccase -t lower";
      t = ":pipe ccase -t title";
      c = ":pipe ccase -t camel";
      p = ":pipe ccase -t pascal";
      s = ":pipe ccase -t snake";
      k = ":pipe ccase -t kebab";
    };

    space.i = ":toggle-option lsp.display-inlay-hints";

    # Replace `g+n` and `g+p` with `space+]` and `space+[`
    g.n = "no_op";
    g.p = "no_op";
    space."]" = "goto_next_buffer";
    space."[" = "goto_previous_buffer";

    # `space + '` to close a buffer
    space."'" = ":buffer-close";

    # Goto declaration
    g.D = {
      # In the current window
      c = [ "goto_declaration" ];
      # In a vertical window
      v = [
        "vsplit"
        "jump_view_up"
        "goto_declaration"
      ];
      # In a horizontal window
      h = [
        "hsplit"
        "jump_view_up"
        "goto_declaration"
      ];
    };

    # Goto defentation
    g.d = {
      # In the current window
      c = [ "goto_definition" ];
      # In a vertical window
      v = [
        "vsplit"
        "jump_view_up"
        "goto_definition"
      ];
      # In a horizontal window
      h = [
        "hsplit"
        "jump_view_up"
        "goto_definition"
      ];
    };
  };
}
