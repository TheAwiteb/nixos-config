# Fetch all the files in the directory except this one, import them, and pass
# inputs to them. These files are Rust crates; these projects will be built and
# returned as pkgs to be used in `home.nix`.
{
  ...
}@inputs:
let
  inherit (builtins)
    map
    filter
    attrNames
    readDir
    ;
in
(map (pkgFile: ((import ./${pkgFile}) inputs)) (
  filter (file: file != "default.nix") (attrNames (readDir ./.))
))
