{
  pkgs,
  ...
}:
let
  inherit (pkgs) rustPlatform fetchCrate;
in
rustPlatform.buildRustPackage rec {
  pname = "lprs";
  version = "2.0.0";
  buildNoDefaultFeatures = true;

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-jvIhyffIk8z/tM+rLUpXstyiq6xyQr18UgYER6DSW3E=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-SOIxfIXQ0YGLn5t0p5vpZK+1mdYEbzoI03+5nnfmw00=";
}
