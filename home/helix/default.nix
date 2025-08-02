{
  pkgs-unstable,
  ...
}:
{
  imports = [
    ./keys-insert.nix
    ./keys-normal.nix
    ./keys-select.nix
    ./languages.nix
    ./themes
  ];

  programs.helix = {
    enable = true;
    package = pkgs-unstable.helix;
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
      mode.normal = "NORMAL";
      mode.insert = "INSERT";
      mode.select = "SELECT";
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
