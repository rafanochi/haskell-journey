{
  description = "Haskell REST API with PostgreSQL";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      hpkgs = pkgs.haskell.packages."ghc910";

    in
    {
      devShells = {
        # system key
        "x86_64-linux" = {
          default = pkgs.mkShell {
            buildInputs = [
              hpkgs.cabal-install
              hpkgs.cabal-add
              hpkgs.haskell-language-server
              hpkgs.fourmolu
              hpkgs.hlint
              hpkgs.hpack
              hpkgs.cabal-fmt
              hpkgs.postgresql-libpq
              hpkgs.postgresql-libpq-configure

              pkgs.just
              pkgs.alejandra
              pkgs.zlib
              pkgs.treefmt
              pkgs.libpq.dev
              pkgs.zlib.dev
              pkgs.postgresql
              pkgs.libz
              pkgs.libpq.pg_config
              pkgs.pkg-config
              pkgs.xz
            ];
          };
        };
      };
      shellHook = ''
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${pkgs.postgresql}/lib
      '';
    };
}

