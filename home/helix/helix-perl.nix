# Source https://github.com/BennyDeeDev/nix-config/blob/6e430abc6473d7e27be395e5a0d913cf0000a542/overlays/helix-perl.nix
# Thank you BennyDeeDev

let
  # Remove once helix-editor/helix#16348 is in the locked Helix revision.
  perlRev = "aa5600c8df1eb9ed111db72e20c741dd73ec336a";
in
_: prev: {
  perl = prev.perl.overrideAttrs {
    version = perlRev;
    src = fetchTree {
      type = "github";
      owner = "tree-sitter-perl";
      repo = "tree-sitter-perl";
      rev = perlRev;
    };
  };
}
