{
  pkgs,
  flakeInputsPkgs,
  ...
}:
let
  helixGrammarOverlays = [
    (import ./helix-perl.nix)
  ];
  helixPatches = [
    ./patches/14795-ensure-cursor-is-in-view-after-LSP-jump-commands.patch
    ./patches/16070-clear-document-diagnostics-when-lsp-restart.patch
    ./patches/16455-prevent-selection-underflow-after-prior-deletion.patch
  ];

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
