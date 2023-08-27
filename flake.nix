{
  inputs.haumea.url = "github:nix-community/haumea/v0.2.2";
  inputs.hive.url = "github:whs-dot-hk/hive/test";
  inputs.home-manager.url = "github:nix-community/home-manager";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.nur.url = "github:nix-community/NUR";
  inputs.std.url = "github:divnix/std";
  inputs.userjs.url = "github:arkenfox/user.js";

  inputs.hive.inputs.nixpkgs.follows = "nixpkgs";
  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";
  inputs.std.inputs.nixpkgs.follows = "nixpkgs";

  inputs.hive.inputs.paisano.url = "github:paisano-nix/core";
  inputs.std.inputs.paisano.url = "github:paisano-nix/core";

  inputs.userjs.flake = false;

  outputs = {
    hive,
    self,
    std,
    ...
  } @ inputs:
    std.growOn {
      inherit inputs;

      cellsFrom = ./cells;
      cellBlocks = with (std.blockTypes // hive.blockTypes); [
        (functions "homeProfiles")
        homeConfigurations
      ];
    }
    {homeConfigurations = hive.collect self "homeConfigurations";};
}
