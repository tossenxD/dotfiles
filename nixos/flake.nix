{
  description = "Main Nix flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs, ... }:
  let
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      T14 = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./configuration.nix ./hosts/T14.nix ];
      };
      apollo69 = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./configuration.nix ];
      };
    };
  };
}
