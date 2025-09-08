{
  pkgs,
  ...
}:
let
  inherit (pkgs) rustPlatform fetchCrate;
in
rustPlatform.buildRustPackage rec {
  pname = "typeman";
  version = "0.1.4";
  buildNoDefaultFeatures = true;

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-cXgBdD0f2OXy1BDiX4Bu2XiBg+j+OnB6HbQ2Cbbu0e4=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-0N5KnviCev4ri5xFwVeoSBSZnANGYO+aDTe66XefLgk=";

  buildInputs = with pkgs; [
    alsa-lib
  ];
}
