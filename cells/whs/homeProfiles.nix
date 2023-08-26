{
  inputs,
  cell,
}: let
  inherit (inputs) haumea;
in
  haumea.lib.load {
    src = ./homeProfiles;
    inputs = {
      inherit cell;
      inherit inputs;
    };
  }
