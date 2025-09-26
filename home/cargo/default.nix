{ ... }:
{
  home.file.".cargo/config.toml" = {
    enable = true;
    force = true;
    source = ./config.toml;
  };
}
