{
  pkgs,
  ...
}:
let
  inherit (pkgs) rustPlatform fetchCrate;
in
rustPlatform.buildRustPackage rec {
  pname = "trashy";
  version = "2.0.0";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-1xHyhAV8hpgMngQdamRzEliyG60t+I3KfsDJi0+180o=";
  };

  cargoHash = "sha256-tlz8WeFOxNPJxCqwqH98S/JkU7MZSDj/OaPvNkf6iwg=";
}
