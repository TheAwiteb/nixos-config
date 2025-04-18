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
    C-y = [ "scroll_up" ];
    # Scroll view down
    C-e = [ "scroll_down" ];

    # Cutom commands
    space.space = {
      # Git blame
      b = ":sh git blame -L %{cursor_line},%{cursor_line} %{buffer_name}";
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

    g.D = "no_op";
    space.i = ":toggle-option lsp.display-inlay-hints";

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
