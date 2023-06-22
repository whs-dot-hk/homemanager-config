{ inputs, cell }:
let inherit (inputs) nixpkgs home-manager nur userjs;
in {
  whs = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs;
    modules = [ nur.hmModules.nur ./home.nix ];
    extraSpecialArgs = { inherit userjs; };
  };

}
