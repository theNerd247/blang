pkgName: self: super:

let
  hpkgs = self.haskellPackages;
  pkg   = hpkgs."${pkgName}";
  pkgEnv = pkg.envFunc 
  { withHoogle = true; 
  };
in

{ "${pkgName}-shell" = super.mkShell 
  { inputsFrom = [ pkgEnv ]; 
    buildInputs = with hpkgs;
     [ cabal-install
       ghcid
     ];
   };
}
