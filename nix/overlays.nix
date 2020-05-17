let
  mkHaskellShell = import ./mkHaskellShell.nix;
in

[ (import ./haskell.nix)
  (mkHaskellShell "blang")
]
