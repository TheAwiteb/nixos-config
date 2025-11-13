{
  pkgs,
  ...
}:
let
  inherit (pkgs) rustPlatform fetchCrate;
in
rustPlatform.buildRustPackage rec {
  pname = "typeman";
  version = "0.1.9";
  buildNoDefaultFeatures = true;
  buildFeatures = [ "tui" ];

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-KayxHnVlIZyWtwkPEg+sejFr6dtTxeGxdauP+ViSgL8=";
  };

  cargoHash = "sha256-x6PbDNWagD2IscZGhffZfWfvqA9n/gujjLk/gxHkviY=";

  doCheck = false;
}
