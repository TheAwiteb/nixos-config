{
  pkgs,
  ...
}:
{
  programs.gpg = {
    enable = true;
    package = pkgs.gnupg;
    settings = {
      default-key = "4F0E0686B1C850BAF9ED9FDF3F6B55640AA6682F";
    };
  };
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 8 * 60 * 60;
    maxCacheTtl = 8 * 60 * 60;
    # enableSshSupport = true;
  };
}
