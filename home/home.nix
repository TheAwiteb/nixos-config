# TODO: Setup gtk <ref https://github.com/colonelpanic8/dotfiles/blob/2df1d71367187322efcd149452fc6207dd7b0f80/nixos/home-manager.nix#L57>
{
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}:
let
  n34 = inputs.n34.packages."${pkgs.system}".default;
  dejadup = (import ./dejadup { inherit pkgs; });
in
{
  imports = [
    ./alacritty
    ./bat
    ./dejadup/ignore.nix
    ./eza
    ./git
    ./gnome-settings.nix
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

    packages = [
      n34
      dejadup
    ]
    ++ ((import ./rust-crates) { inherit pkgs; })
    ++ (with pkgs; [
      bc
      curl
      discord
      fastfetch
      gnome-tweaks
      htop
      jq
      lazpaint
      libossp_uuid
      libreoffice-qt6-fresh
      lm_sensors
      scooter
      sqlitebrowser
      wget
      xclip
      zola
    ])
    ++ (with pkgs-unstable; [
      brave
      gnomeExtensions.clipboard-history
      just
      monero-gui
      nak
      nixd
      nixfmt-rfc-style
      nushell
      openssl
      prismlauncher
      ripgrep
      sd
      signal-desktop
      simple-completion-language-server
      skim
      taplo
      telegram-desktop
      tor-browser
      vlc
      wasabiwallet
      zed-editor
    ]);
  };

  programs.home-manager.enable = true;
  home.stateVersion = "25.05";
}
