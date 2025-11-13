{
  pkgs,
  ...
}:
let
  inherit (pkgs) rustPlatform fetchCrate;
in
rustPlatform.buildRustPackage rec {
  pname = "oxdraw";
  version = "0.1.0";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-McpjCHD2IJVcucMUDQtVCdKClCP2pK7FqoMe3Cm9qHg=";
  };

  cargoHash = "sha256-/bbD3wO4jsHCXJvCbQIl9dQ6tEpaaZ2+mwyr+V5bNtU=";

  installPhase = ''
    mkdir -p $out/bin
    cp -r ./frontend/out/ $out/frontend/
    mv ./target/**/release/oxdraw $out/bin/
  '';
}
