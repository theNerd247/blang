pkgName: self: super:

let
  hpkgs = self.haskellPackages;
  pkg   = hpkgs."${pkgName}";
in

{ "${pkgName}-shell" = super.mkShell
  { inputsFrom  = [ pkg pkg.env ];
    buildInputs = with hpkgs;
    [ cabal-install
      ghcid 
      (hoogleLocal { packages = super.haskell.lib.getHaskellBuildInputs pkg; })
    ];
  };
}
