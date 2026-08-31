{
  pkgs,
  ...
}:
{
  programs.gpg = {
    enable = true;
    package = pkgs.gnupg;
    mutableKeys = true;
    mutableTrust = true;

    settings = {
      cert-digest-algo = "SHA512";
      default-key = "4F0E0686B1C850BAF9ED9FDF3F6B55640AA6682F";
      default-preference-list = "SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed";
      display-charset = "utf-8";
      keyid-format = "0xlong";
      list-options = "show-uid-validity";
      no-comments = true;
      no-emit-version = true;
      no-symkey-cache = true;
      personal-cipher-preferences = "AES256 AES192 AES";
      personal-compress-preferences = "ZLIB BZIP2 ZIP Uncompressed";
      personal-digest-preferences = "SHA512 SHA384 SHA256";
      require-cross-certification = true;
      s2k-cipher-algo = "AES256";
      s2k-digest-algo = "SHA512";
      verify-options = "show-uid-validity";
      with-fingerprint = true;
    };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableZshIntegration = true;

    # SSH key
    sshKeys = [ "4C68027D6DF9B9AD38262EE7C6D3E1ABCF1541BA" ];

    # Zero TTL = prompt every time, never cache
    defaultCacheTtl = 1;
    maxCacheTtl = 1;
    defaultCacheTtlSsh = 5;
    maxCacheTtlSsh = 30;
    noAllowExternalCache = true;

    pinentry.package = pkgs.pinentry-gnome3;
  };
}
