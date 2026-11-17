{
  pkgs,
  flakeInputsPkgs,
  ...
}:
let
  helixGrammarOverlays = [
    (import ./helix-perl.nix)
  ];

  /*nixfmt:disable*/
  helixPatches = [
    ./patches/14795-ensure-cursor-is-in-view-after-LSP-jump-commands.patch # Grabbed on 2026-11-13
    ./patches/16070-clear-document-diagnostics-when-lsp-restart.patch      # Grabbed on 2026-11-13
    ./patches/16455-prevent-selection-underflow-after-prior-deletion.patch # Grabbed on 2026-11-13
    ./patches/16450-sort-deletions-before-merging.patch                    # Grabbed on 2026-11-13
    ./patches/16451-count-kept-ranges-for-the-new-primary-index.patch      # Grabbed on 2026-11-13
    ./patches/16454-restart-position-mapping-when-input-is-unsorted.patch  # Grabbed on 2026-11-13
    ./patches/16412-labels-for-keymap-commands.patch                       # Grabbed on 2026-11-15
    ./patches/13666-statusline-elements-style-support.patch                # Grabbed on 2026-11-16
    ./patches/15573-add-breadcrumb-navigation-bar.patch                    # Grabbed on 2026-11-18
  ];
  /*nixfmt:enable*/

  # Helix calls `rustPlatform.buildRustPackage` and passes it a function that
  # takes one argument and returns a set. This set should be passed to
  # `buildRustPackage`, but here I intercept it, add my patches, and then pass
  # it to the real `buildRustPackage`.
  #
  # I read the Helix flake multiple times; it is hard to understand, and I don't
  # think I can patch `helix-unwrapped` while keeping it inside the wrapper
  # other than this.
  patchedRustPlatform = pkgs.rustPlatform // {
    buildRustPackage =
      helixFn:
      let
        helixSet = (helixFn null);
        patchedSet = helixSet // {
          patches = (helixSet.patches or [ ]) ++ helixPatches;
        };
      in
      pkgs.rustPlatform.buildRustPackage (_: patchedSet);
  };

  helixPatched = flakeInputsPkgs.helix.override {
    grammarOverlays = helixGrammarOverlays;
    rustPlatform = patchedRustPlatform;
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
    theme = "catppuccin_mocha_updated"; # Custom theme in ./themes/

    editor = {
      end-of-line-diagnostics = "hint";
      cursorline = true;
      color-modes = true;
      line-number = "relative";
      scroll-lines = 6;
      trim-trailing-whitespace = true;
      bufferline = "always";
      mouse = false;
      rainbow-brackets = true;
      true-color = true;
    };

    editor.breadcrumb = {
      enable = true;
      path = "none";
    };

    editor.inline-diagnostics.cursor-line = "hint";

    editor.statusline = {
      left = [
        "mode"
        "version-control"
        "file-name"
        "total-line-numbers"
        "file-modification-indicator"
      ];
      right = [
        "diagnostics"
        "workspace-diagnostics"
        "read-only-indicator"
        "primary-selection-length"
        "selections"
        "position"
        "file-encoding"
        "file-type"
      ];
      mode.normal = "𝙉";
      mode.insert = "𝙄";
      mode.select = "𝙎";
    };

    editor.lsp = {
      display-messages = true;
      display-progress-messages = true;
      auto-document-highlight = true;
      display-inlay-hints = true;
    };

    editor.whitespace.render = {
      newline = "none";
      space = "all";
      tab = "all";
    };

    editor.indent-guides = {
      render = true;
      character = "┊"; # Some characters that work well: "▏", "┆", "╎", "⸽"
    };

    editor.file-picker = {
      hidden = false;
      ignore = false;
      git-ignore = true;
    };
  };
}
