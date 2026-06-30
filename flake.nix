{
  description = "My NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    n34.url = "git+https://git.4rs.nl/awiteb/n34.git";
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
          config = {
            allowUnfree = true;
          };
        }
      );
      pkgs-unstable = (
        import nixpkgs-unstable {
          inherit system;
          config = {
            allowUnfree = true;
          };
        }
      );
      secrets = (import ./secrets);
    in
    {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          specialArgs = { inherit pkgs-unstable secrets; };
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
              ;
          };
          modules = [
            ./home/home.nix
          ];
        };
      };
    };
}
