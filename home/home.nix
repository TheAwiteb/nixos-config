{
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}:
let
  hostSystem = pkgs.stdenv.hostPlatform.system;
  n34 = inputs.n34.packages."${hostSystem}".default;

  patchedPackages = {
    deja-dup = pkgs.deja-dup.overrideAttrs (
      final: prev: {
        patches = (prev.patches or [ ]) ++ [ ./dejadup/dejadupignore-file.patch ];
      }
    );
  };
in
{
  imports = [
    ./alacritty
    ./background_jobs
    ./bat
    ./dejadup
    ./eza
    ./git
    ./gnome
    ./gnupg
    ./helix
    ./obs
    ./ssh
    ./zellij
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
      patchedPackages.deja-dup
    ]
    ++ ((import ./rust-crates) { inherit pkgs; })
    ++ (with pkgs; [
      bc
      curl
      fastfetch
      gnome-tweaks
      htop
      jq
      lazpaint
      libossp_uuid
      libreoffice-qt6-fresh
      lm_sensors
      nushell
      openssl
      prismlauncher
      ripgrep
      scooter
      sd
      skim
      sqlitebrowser
      wasabiwallet
      wget
      xclip
      xwayland-satellite
      zed-editor
      zola
    ])
    ++ (with pkgs-unstable; [
      anytype
      brave
      cargo-llvm-cov
      gnomeExtensions.clipboard-history
      just
      monero-gui
      nak
      nixd
      nixfmt
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
