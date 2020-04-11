let
  config =
    { packageOverrides = pkgs: rec
      { haskellPackages = pkgs.haskellPackages.override
        { overrides = hnew: hold:
          { blang = hnew.callCabal2nix "blang" ./blang.cabal {};
          };
        };
      };
    };

  pkgs = import <nixpkgs> { inherit config; };

  ghc = pkgs.haskellPackages.ghcWithPackages 
    (h: 
      with h; 
      [ cabal-install ] ++ blang.buildInputs
    );
in

with pkgs;

if lib.inNixShell then
  mkShell
    { buildInputs = [ ghc ]; 
    }
else
  { blang = ghc.blang;
  }
