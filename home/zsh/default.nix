{
  ...
}:
{
  imports = [
    ./aliases.nix
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 1000;
    history.append = true;
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    custom = builtins.toString ./custom_omz_dir;
    theme = "oxide";
    plugins = [ ];
  };

  programs.zsh.sessionVariables = {
    EDITOR = "hx";
    ZELLIJ_AUTO_EXIT = "true";
  };
}
