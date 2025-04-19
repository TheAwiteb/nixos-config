# TODO: Setup gtk <ref https://github.com/colonelpanic8/dotfiles/blob/2df1d71367187322efcd149452fc6207dd7b0f80/nixos/home-manager.nix#L57>
{
  pkgs,
  pkgs-unstable,
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

  fonts.fontconfig.enable = true;

  home = {
    username = "awiteb";
    homeDirectory = "/home/awiteb";
    sessionPath = [
      "$HOME/.local/bin"
    ];

    packages =
      ((import ./rust-crates) { inherit (pkgs) rustPlatform fetchCrate; })
      ++ (with pkgs; [
        curl
        fastfetch
        gnome-tweaks
        htop
        jq
        libossp_uuid
        wget
        xclip
      ])
      ++ (with pkgs-unstable; [
        brave
        gnomeExtensions.clipboard-history
        just
        monero-gui
        nixd
        nixfmt-rfc-style
        openssl
        ripgrep
        rustup
        sd
        simple-completion-language-server
        taplo
        telegram-desktop
        tor-browser
        trashy
      ])
      ++ [
        (pkgs.nerdfonts.override {
          fonts = [
            "FiraCode"
            "ComicShannsMono"
          ];
        })
      ];
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
