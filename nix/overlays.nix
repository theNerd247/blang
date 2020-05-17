let
  mkHaskellShell = pkgName: self: super:
  let
    hpkgs = self.haskellPackages;
    pkg = hpkgs."${pkgName}";
  in
    { "${pkgName}-shell" = super.mkShell
      { inputsFrom  = [ pkg pkg.env ];  
        buildInputs = with hpkgs; [ cabal-install ghcid ];
      };
    };
in
[ (import ./haskell.nix)
  (mkHaskellShell "blang")
]
