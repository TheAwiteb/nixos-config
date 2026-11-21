{
  description = "My NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    n34 = {
      url = "git+https://git.4rs.nl/awiteb/n34.git";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.rust-overlay.follows = "rust-overlay";
    };
    helix = {
      url = "github:helix-editor/helix/1a3fdfda6dfdda4567af6093a6249bb2bb422fc6";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.rust-overlay.follows = "rust-overlay";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = (
        import nixpkgs {
          inherit system;
        }
      );
      pkgs-unstable = (
        import nixpkgs-unstable {
          inherit system;
        }
      );
      secrets = (import ./secrets);
      flakeInputsPkgs = {
        n34 = inputs.n34.packages."${system}".default;
        helix = inputs.helix.packages."${system}".default;
      };
    in
    {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          specialArgs = { inherit secrets; };
          modules = [ ./host/host.nix ];
        };
      };

      homeConfigurations = {
        awiteb = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit
              inputs
              pkgs-unstable
              secrets
              flakeInputsPkgs
              ;
          };
          modules = [
            ./home/home.nix
          ];
        };
      };
    };
}
