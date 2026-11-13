{
  flakeInputsPkgs,
  ...
}:
let
  helixPerlOverlay = import ./helix-perl.nix;
  helixPatched = flakeInputsPkgs.helix.override {
    grammarOverlays = [ helixPerlOverlay ];
  };
in
{
  imports = [
    ./keys-insert.nix
    ./keys-normal.nix
    ./keys-select.nix
    ./languages.nix
    ./themes
  ];

  # symlink `runtime` directory
  home.file.".config/helix/runtime" = {
    source = ./runtime;
    recursive = true;
  };

  programs.helix = {
    enable = true;
    package = helixPatched;
  };
  programs.helix.settings = {
    theme = "doom-updated"; # Custom theme in ./themes/doom-updated.nix

    editor = {
      end-of-line-diagnostics = "hint";
      cursorline = true;
      color-modes = true;
      indent-guides.render = true;
      line-number = "relative";
      scroll-lines = 6;
    };

    editor.inline-diagnostics.cursor-line = "hint";

    editor.statusline = {
      left = [
        "mode"
        "spinner"
        "spacer"
        "version-control"
        "file-name"
        "file-modification-indicator"
      ];
      right = [
        "diagnostics"
        "workspace-diagnostics"
        "selections"
        "position"
        "file-encoding"
        "file-type"
      ];
      mode.normal = "NOR";
      mode.insert = "INS";
      mode.select = "SEL";
    };

    editor.lsp = {
      display-messages = true;
      display-inlay-hints = true;
    };

    editor.whitespace.render = {
      newline = "none";
      space = "all";
      tab = "all";
    };

    editor.file-picker = {
      hidden = false;
      ignore = false;
      git-ignore = true;
    };
  };
}
