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
  };
  outputs = { nixpkgs, home-manager, nur, userjs, ... }:
    let
      system = "x86_64-linux";
      overlay = f: p: { inherit userjs; };
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nur.overlay overlay ];
      };
    in {
      homeConfigurations.whs = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
      };
    };
}
