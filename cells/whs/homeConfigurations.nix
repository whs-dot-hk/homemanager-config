{
  inputs,
  cell,
}: let
  inherit (inputs) home-manager;
  inherit (inputs) nixpkgs;
  inherit (inputs) nur;
in {
  whs = {
    bee.home = home-manager;
    bee.pkgs = nixpkgs;
    bee.system = "x86_64-linux";

    imports = [
      nur.hmModules.nur

      cell.homeProfiles.firefox
      cell.homeProfiles.git
      cell.homeProfiles.home
      cell.homeProfiles.packages
      cell.homeProfiles.smplayer
      cell.homeProfiles.vim
    ];
  };
}
