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
      "TODO.md"
      "/.vscode"
      "/target"
      ".nix-profile"
      ".nix-profile-*-link"
    ];
    hooks = {
      prepare-commit-msg = ./prepare-commit-msg;
    };
  };

  programs.git.extraConfig = {
    init.defaultBranch = "master"; # In case they changed it to anything else
    merge.conflictstyle = "diff3";
    pull.rebase = true;
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
