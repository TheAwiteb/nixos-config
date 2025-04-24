{
  pkgs,
  ...
}:
let
  inherit (pkgs)
    rustPlatform
    fetchCrate
    pkg-config
    openssl
    ;
in
rustPlatform.buildRustPackage rec {
  pname = "ngit";
  version = "1.6.1";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-XXUY3GwgIazhl/CRQoIP0I66mzDj57kBiu1nzka7Fqs=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-yp9/MXF/QI6z+MAh2ypdATFfThCyOpzPorVvtGWnAaw=";

  buildInputs = [
    pkg-config # required by git2
    openssl
  ];
  nativeBuildInputs = [
    pkg-config # required by git2
    openssl
  ];
  doCheck = false;
}
