{ pkgs ? import ./pkgs.nix }:

with pkgs;
let
  drv = callPackage ./default.nix {};
in
  drv.overrideAttrs (attrs: {
    src = null;
    shellHook = ''
      echo 'Entering ${attrs.pname}'
      set -v

      set +v
    '';
  })
