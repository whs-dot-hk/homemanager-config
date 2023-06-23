{ inputs, cell }:
let inherit (inputs) nixpkgs home-manager nur;
in {
  whs = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs;
    modules = [ nur.hmModules.nur cell.modules.home ];
  };
}
