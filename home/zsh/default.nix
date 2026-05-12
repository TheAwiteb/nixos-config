{
  config,
  ...
}:
let
  zshDir = "${config.home.homeDirectory}/.omz";
  zshCustom = "${zshDir}/custom";
  zshThemes = "${zshCustom}/themes";
in
{
  imports = [
    ./aliases.nix
  ];

  home.file."${zshThemes}/oxide.zsh-theme" = {
    enable = true;
    source = ./oxide.zsh-theme;
    force = true;
  };
  home.file.".user.justfile" = {
    enable = true;
    force = true;
    source = ./.user.justfile;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 20000;
    history.append = true;
    history.ignoreAllDups = true;
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    custom = zshCustom;
    theme = "oxide";
    plugins = [ ];
  };

  programs.zsh.sessionVariables = {
    EDITOR = "hx";
    ZSH = zshDir;
    DISABLE_AUTO_TITLE = "true";
  };
}
