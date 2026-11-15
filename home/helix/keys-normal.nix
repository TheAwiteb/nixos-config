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

    # Custom commands
    space.space = {
      label = "Custom commands";
      y = {
        label = "Open Yazi file manager";
        command = [
          '':insert-output yazi "%{buffer_name}"''
          ":redraw"
          ":reload-all"
        ];
      };
      g = {
        label = "Open GitUI";
        command = [
          ":write-all"
          ":new"
          ":insert-output gitui >/dev/tty"
          ":buffer-close!"
          ":redraw"
          ":reload-all"
        ];
      };
    };

    # Text case changer, by ccase <https://github.com/rutrum/ccase>
    A-c = {
      label = "Text case changer";
      u = {
        label = "Change case to UPPER";
        command = ":pipe ccase -t upper";
      };
      l = {
        label = "Change case to lower";
        command = ":pipe ccase -t lower";
      };
      t = {
        label = "Change case to Title";
        command = ":pipe ccase -t title";
      };
      c = {
        label = "Change case to camelCase";
        command = ":pipe ccase -t camel";
      };
      p = {
        label = "Change case to PascalCase";
        command = ":pipe ccase -t pascal";
      };
      s = {
        label = "Change case to snake_case";
        command = ":pipe ccase -t snake";
      };
      k = {
        label = "Change case to kebab-case";
        command = ":pipe ccase -t kebab";
      };
    };

    space.i = {
      label = "Toggle LSP inlay hints";
      command = ":toggle-option lsp.display-inlay-hints";
    };

    # Replace `g+n` and `g+p` with `space+]` and `space+[`
    g.n = "no_op";
    g.p = "no_op";
    space."]" = "goto_next_buffer";
    space."[" = "goto_previous_buffer";

    # `space + '` to close a buffer
    space."'" = ":buffer-close";

    # Goto declaration
    g.D = {
      label = "Goto declaration";
      c = {
        label = "Goto declaration (current window)";
        command = [ "goto_declaration" ];
      };
      v = {
        label = "Goto declaration (vertical split)";
        command = [
          "vsplit"
          "jump_view_up"
          "goto_declaration"
        ];
      };
      h = {
        label = "Goto declaration (horizontal split)";
        command = [
          "hsplit"
          "jump_view_up"
          "goto_declaration"
        ];
      };
    };

    # Goto definition
    g.d = {
      label = "Goto definition";
      c = {
        label = "Goto definition (current window)";
        command = [ "goto_definition" ];
      };
      v = {
        label = "Goto definition (vertical split)";
        command = [
          "vsplit"
          "jump_view_up"
          "goto_definition"
        ];
      };
      h = {
        label = "Goto definition (horizontal split)";
        command = [
          "hsplit"
          "jump_view_up"
          "goto_definition"
        ];
      };
    };
  };
}
