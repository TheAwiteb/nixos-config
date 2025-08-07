# TODO: Setup gtk <ref https://github.com/colonelpanic8/dotfiles/blob/2df1d71367187322efcd149452fc6207dd7b0f80/nixos/home-manager.nix#L57>
{
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}:
{
  imports = [
    ./alacritty
    ./bat
    ./eza
    ./git
    ./gnupg
    ./helix
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

    packages =
      ((import ./rust-crates) { inherit pkgs; })
      ++ (with inputs; [
        n34.packages."${pkgs.system}".default
      ])
      ++ (with pkgs; [
        curl
        fastfetch
        gnome-tweaks
        htop
        jq
        libossp_uuid
        libreoffice-qt6-fresh
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
        nixd
        nixfmt-rfc-style
        openssl
        prismlauncher
        ripgrep
        sd
        signal-desktop
        simple-completion-language-server
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
