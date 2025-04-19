{
  ...
}:
{
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
    plugins = [
      "sudo"
      "rust"
    ];
  };

  programs.zsh.sessionVariables = {
    EDITOR = "hx";
    ZELLIJ_AUTO_EXIT = "true";
  };

  programs.zsh.shellAliases = {
    ll = "ls -l";
    ".." = "z ..";
    ".j" = "just --justfile ~/.user.justfile --working-directory .";
    ze = "zellij";
    e = "eza";
    j = "just";
    tra = "trash put";
    fdate = "date +'%Y/%m/%d %r'";
    cat = "bat --style header --style snip --style changes --style header";
    c = "cargo";
    cr = "c r -q";
    cf = "c fmt";
    cfull = "cf --check && c clippy && c c";
    ccfull = "c +nightly fmt --check && c +nightly clippy && c +nightly c";
    git-head = "git log HEAD^..HEAD --pretty=%H";
    g = "TZ=UTC git";
    gc = "g commit -m";
    gr = "g rebase -i";
    gcr = "g commit --amend '-S'";
    grc = "g rebase --continue";
    gms = "g merge --squash";
    md = "mkdir";
    "7zenc" = "7z a -t7z -m0=lzma2 -mx=9 -mfb=64 -md=32m -ms=on -mhe=on -p";
  };
}
