let
  inherit (config._module.args) pkgs;
in {
  home.packages = with pkgs; [alejandra];
}
