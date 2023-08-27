{
  inputs,
  cell,
}: let
  inherit (inputs) hive;
in
  removeAttrs
  (hive.findLoad {
    inherit cell;
    inherit inputs;

    block = ./.;
  })
  ["default"]
