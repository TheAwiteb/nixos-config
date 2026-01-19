{
  pkgs,
  ...
}:
let
  inherit (pkgs)
    rustPlatform
    fetchCrate
    installShellFiles
    lib
    stdenv
    ;
in
rustPlatform.buildRustPackage rec {
  pname = "lprs";
  version = "3.0.0";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-DCuvyq5GbFSea5BCHuNQ3xvqgE3b3s5PlmUMaFqm7og=";
  };

  cargoHash = "sha256-6VMuEzbeee9QFzlqh0wuo/MAnj3vlORK4NjTK5v3Vts=";

  nativeBuildInputs = [
    installShellFiles
  ];

  # Generate completion.
  postInstall = lib.optionalString (stdenv.buildPlatform.canExecute stdenv.hostPlatform) ''
    touch $out/lprs.lprs
    installShellCompletion --cmd lprs \
      --bash <($out/bin/lprs -f $out/lprs.lprs completion bash) \
      --fish <($out/bin/lprs -f $out/lprs.lprs completion fish) \
      --zsh <($out/bin/lprs -f $out/lprs.lprs completion zsh)
  '';
}
