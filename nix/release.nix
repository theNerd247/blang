pkgArgs:

let
  pkgs = 
  ( import ./nixpkgs.nix 
    { overlays =  (import ./overlays.nix);
    }
  );
in

{ inherit pkgs;
}
