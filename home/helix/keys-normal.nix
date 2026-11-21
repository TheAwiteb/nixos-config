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
    # search selection
    "A-/" = [ "search_selection" ];

    "]".G = {
      label = "Goto next git conflict";
      command = [
        ":set-register / <<<<<<< HEAD"
        "search_next"
        ":clear-register /"
        ":echo done, if any"
      ];
    };
    "[".G = {
      label = "Goto previous git conflict";
      command = [
        ":set-register / <<<<<<< HEAD"
        "search_prev"
        ":clear-register /"
        ":echo done, if any"
      ];
    };

    # Custom commands
    space.space = {
      label = "External tools";
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

    # Git blame
    space.l =
      let
        hash = "git blame -L %{cursor_line},%{cursor_line} --porcelain '%{buffer_name}' | awk 'NR==1{print $1}'";
        wlCopyCmd = "printf '%%s' \"$out\" | wl-copy -n --type text/plain > /dev/null 2>&1";

        # Copy stdout to the clipboard, then report in the statusline.
        copy = desc: cmd: ":echo %sh(out=$(${cmd}); ${wlCopyCmd}; printf '%%s' \"Copied ${desc}: $out\")";
      in
      {
        label = "Git blame operations";
        b = {
          label = "Show line blame on screen";
          command = ":sh git blame -L %{cursor_line},%{cursor_line} '%{buffer_name}'";
        };
        c = {
          label = "Copy short commit id";
          command = copy "short commit id" "git rev-parse --short $(${hash})";
        };
        C = {
          label = "Copy full commit id";
          command = copy "full commit id" hash;
        };
        e = {
          label = "Copy author email";
          command = copy "author email" "git log -1 --format=%%ae $(${hash})";
        };
        n = {
          label = "Copy author name";
          command = copy "author name" "git log -1 --format=%%an $(${hash})";
        };
        d = {
          label = "Copy author and date";
          command = copy "author and date" "git log -1 --format='%%an, %%ad' --date=iso $(${hash})";
        };
        s = {
          label = "Copy commit subject";
          command = copy "commit subject" "git log -1 --format=%%s $(${hash})";
        };
        p = {
          label = "Show full commit info";
          command = ":sh git show --stat $(${hash})";
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
