{
  pkgs-unstable,
  ...
}:
{
  programs.git = {
    enable = true;
    package = pkgs-unstable.gitFull;

    signing.key = "4F0E0686B1C850BAF9ED9FDF3F6B55640AA6682F";
    signing.signByDefault = true;

    ignores = [
      "TODO"
      "TODO.md"
      "/.helix"
      "/target"
      ".nix-profile"
      ".nix-profile-*-link"
    ];
    hooks = {
      prepare-commit-msg = ./prepare-commit-msg;
    };
  };

  programs.git.settings = {
    user.name = "Awiteb";
    user.email = "a@4rs.nl";

    init.defaultBranch = "master"; # In case they changed it to anything else
    merge.conflictstyle = "zdiff3";
    pull.rebase = true;
    format = {
      useAutoBase = true;
      coverLetter = true;
      coverFromDescription = "auto";
      outputDirectory = "patches";
    };
  };

  programs.delta = {
    package = pkgs-unstable.delta;
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      line-numbers = true;
      side-by-side = true;
      hyperlinks = true;
    };
  };
}
