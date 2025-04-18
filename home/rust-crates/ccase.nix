{
  rustPlatform,
  fetchCrate,
  ...
}:
rustPlatform.buildRustPackage rec {
  pname = "ccase";
  version = "0.4.1";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-a0JO+k5rNbuuLZi9sZwjuVNOHu8VoqGI6YTJU6v3ZWY=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-RLjwLr1IF1T3QR5t8i2dGEWs72YY49Ib1l8QlaFkcqg=";
}
