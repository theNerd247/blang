self: super: 

{ haskellPackages = super.haskellPackages.override 
  ( old:  
    { overrides = super.lib.composeExtensions (old.overrides or (_: _: {}))
      ( hself: hsuper: 
        { blang = hself.callCabal2nix "blang" ../blang.cabal {};
        }
      );
    }
  );
}
