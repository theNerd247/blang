let
  pkgs = (import ./nix).pkgs;
in

{ inherit (pkgs) blang-shell;
  inherit (pkgs.haskellPackages) blang;
}
