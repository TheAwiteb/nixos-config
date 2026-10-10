{
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}:
let
  hostSystem = pkgs.stdenv.hostPlatform.system;
  n34 = inputs.n34.packages."${hostSystem}".default;
in
{
  imports = [
    ./background_jobs
    ./bat
    ./eza
    ./git
    ./gnome
    ./gnupg
    ./helix
    ./kitty
    ./obs
    ./ssh
    ./zoxide
    ./zsh
  ];

  home = {
    username = "awiteb";
    homeDirectory = "/home/awiteb";
    sessionPath = [
      "$HOME/.local/bin"
    ];

    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 16;
    };

    packages = [
      n34
    ]
    ++ ((import ./rust-crates) { inherit pkgs; })
    ++ (with pkgs; [
      appstream
      bc
      curl
      element-desktop
      fastfetch
      flatpak-builder
      gnome-tweaks
      gnomeExtensions.blur-my-shell
      gnomeExtensions.open-bar
      htop
      jq
      lazpaint
      libossp_uuid
      libreoffice-qt6-fresh
      lm_sensors
      nushell
      openssl
      python3Packages.diff-cover
      ripgrep
      sd
      skim
      sqlitebrowser
      wasabiwallet
      wget
      xclip
      zed-editor
      zola
    ])
    ++ (with pkgs-unstable; [
      brave
      cargo-llvm-cov
      just
      monero-gui
      nak
      nixd
      nixfmt
      samply
      signal-desktop
      simple-completion-language-server
      taplo
      telegram-desktop
      tor-browser
      vlc
      wl-clipboard
      xdg-utils
    ]);
  };

  programs.home-manager.enable = true;
  home.stateVersion = "25.05";
}
