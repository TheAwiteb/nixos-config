{
  pkgs-unstable,
  ...
}:
{
  programs.git = {
    enable = true;
    package = pkgs-unstable.gitFull;

    userName = "Awiteb";
    userEmail = "a@4rs.nl";

    signing.key = "4F0E0686B1C850BAF9ED9FDF3F6B55640AA6682F";
    signing.signByDefault = true;

    ignores = [
      "TODO"
      ".vscode"
    ];
    hooks = {
      prepare-commit-msg = ./prepare-commit-msg;
    };
  };

  programs.git.extraConfig = {
    pull.rebase = true;
    merge.conflictstyle = "diff3";
    format = {
      useAutoBase = true;
      coverLetter = true;
      coverFromDescription = "auto";
      outputDirectory = "patches";
    };
  };

  programs.git.delta = {
    enable = true;
    package = pkgs-unstable.delta;
    options = {
      navigate = true;
      line-numbers = true;
      side-by-side = true;
      hyperlinks = true;
    };
  };
}
