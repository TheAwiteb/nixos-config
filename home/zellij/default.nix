{
  config,
  pkgs-unstable,
  ...
}:
let
  homeDir = config.home.homeDirectory;
  zjstatus = "${homeDir}/nixos-config/home/zellij/plugins/zjstatus.wasm";
in
{
  imports = [
    ./keybinds.nix
  ];

  home.file.".config/zellij/layouts/default.kdl" = {
    enable = true;
    source = ./layout.kdl;
    force = true;
  };

  home.file.".local/bin/scooter-zellij" = {
    enable = true;
    source = ./scripts/scooter-zellij;
    force = true;
    executable = true;
  };

  home.file.".local/bin/cpu_info.sh" = {
    enable = true;
    source = ./scripts/cpu_info.sh;
    force = true;
    executable = true;
  };

  home.file.".local/bin/gpu_info.sh" = {
    enable = true;
    source = ./scripts/gpu_info.sh;
    force = true;
    executable = true;
  };

  home.file.".local/bin/ram_info.sh" = {
    enable = true;
    source = ./scripts/ram_info.sh;
    force = true;
    executable = true;
  };

  home.file.".local/bin/disk_info.sh" = {
    enable = true;
    source = ./scripts/disk_info.sh;
    force = true;
    executable = true;
  };

  programs.zellij = {
    enable = true;
    package = pkgs-unstable.zellij.overrideAttrs (
      final: prev: {
        # patches = (prev.patches or [ ]) ++ [ ./focus-pane-with-id.patch ];
      }
    );
    enableZshIntegration = true;
  };

  programs.zellij.settings = {
    themes.default = {
      bg = "#585b70";
      fg = "#cdd6f4";
      red = "#f38ba8";
      green = "#76bfbd";
      blue = "#89b4fa";
      yellow = "#f9e2af";
      magenta = "#f5c2e7";
      orange = "#467271";
      cyan = "#89dceb";
      black = "#181825";
      white = "#cdd6f4";
    };

    # Change this to `file:${builtins.toString ./plugins/zjstatus.wasm}` when
    # there is an option to always "yes" the plugins permissions. Now you will
    # be asked always to say yes! because the plugin location changed
    plugins.zjstatus.location = "file:${zjstatus}";

    ui.pane_frames.hide_session_name = true;
    pane_frames = false;
    mouse_mode = false;
    show_startup_tips = false;
    session_serialization = false;
  };
}
