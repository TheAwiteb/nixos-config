{ ... }: {
  programs.helix.themes.catppuccin_mocha_updated = {
    # Start from the upstream catppuccin_mocha theme
    inherits = "catppuccin_mocha";

    # Virtual whitespace rendered as a dark gray block
    "ui.virtual.whitespace" = "whitespace-bg";

    # Active bufferline entry without the default underline
    "ui.bufferline.active" = {
      fg = "mauve";
      bg = "base";
    };

    # Bufferline (both active-row background and inactive entries)
    "ui.bufferline" = {
      bg = "edges-bg";
    };
    "ui.bufferline.background" = {
      bg = "edges-bg";
    };

    # Statusline for the focused window
    "ui.statusline" = {
      bg = "edges-bg";
    };
    # Statusline for unfocused windows
    "ui.statusline.inactive" = {
      fg = "surface2";
      bg = "edges-bg";
    };

    # Vertical/horizontal window separators
    "ui.window" = {
      fg = "edges-bg";
    };

    # Inlay hints: currently redundant (upstream sets these), but kept as a
    # safeguard in case catppuccin/helix#59 changes them later.
    # <https://github.com/catppuccin/helix/pull/59>
    "ui.virtual.inlay-hint" = {
      fg = "surface1";
      bg = "base";
    };
    "ui.virtual.inlay-hint.parameter" = "surface1";
    "ui.virtual.inlay-hint.type" = "surface1";

    # Highlight for matches (e.g. search results)
    "ui.highlight" = {
      bg = "highlight-bg";
      modifiers = [ "bold" ];
    };

    # Visual selection
    "ui.selection" = {
      bg = "selection-bg";
      modifiers = [ "bold" ];
    };

    # Cursor line for the focused window
    "ui.cursorline.primary" = {
      bg = "cursorline-bg";
    };

    # Popup/menu/help background overrides
    "ui.popup" = {
      fg = "text";
      bg = "menus-bg";
    };
    "ui.help" = {
      fg = "overlay2";
      bg = "menus-bg";
    };
    "ui.menu" = {
      fg = "overlay2";
      bg = "menus-bg";
    };

    palette = {
      # Deep black main editor background
      base = "#000000";
      # Background for popups, menus and help
      menus-bg = "#080211";
      # Block color used for rendered indentation/whitespace
      whitespace-bg = "#303030";
      # Background for search/match highlights
      highlight-bg = "#0A0A0A";
      # Background for visual selections
      selection-bg = "#050433";
      # Background for the cursor line
      cursorline-bg = "#010021";
      # Background for UI edges (bufferline, statusline, window separators)
      edges-bg = "#090413";
    };
  };
}
