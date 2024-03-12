{
  description = "EcmaXp's nix-config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nix-darwin, ...}:
  let
    inherit (nix-darwin.lib) darwinSystem;
    aarch64-darwin = {
      system = "aarch64-darwin";
      modules = [
        home-manager.darwinModules.home-manager
        platforms/aarch64-darwin.nix
        profiles/macOS.nix
      ];
    };
  in {
    darwinConfigurations = rec {
      "EcmaXp-M2" = darwinSystem {
        specialArgs.user = "ecmaxp";
        system = aarch64-darwin.system;
        modules = aarch64-darwin.modules ++ [users/ecmaxp.nix];
      };
    };
  };
}
