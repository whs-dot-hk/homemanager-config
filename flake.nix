{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    userjs = {
      url = "https://raw.githubusercontent.com/arkenfox/user.js/master/user.js";
      flake = false;
    };
    std = {
      url = "github:divnix/std";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    haumea = {
      url = "github:nix-community/haumea/v0.2.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { std, self, ... }@inputs:
    std.growOn {
      inherit inputs;

      systems = [ "x86_64-linux" ];

      cellsFrom = ./nix;

      cellBlocks = with std.blockTypes; [
        (functions "configurations")
        (functions "modules")
      ];
    }

    { homeConfigurations = std.pick self [ "home" "configurations" ]; };
}
