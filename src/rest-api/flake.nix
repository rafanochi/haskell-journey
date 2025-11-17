{
  description = "Haskell REST API with PostgreSQL";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      hpkgs = pkgs.haskell.packages."ghc98";

    in
    {
      devShells = {
        # system key
        "x86_64-linux" = {
          default = pkgs.mkShell {
            buildInputs = [
              pkgs.postgresql
              pkgs.libpq
              hpkgs.postgresql-simple
              hpkgs.postgresql-libpq
              hpkgs.postgresql-libpq-configure
            ];
          };
        };
      };
    };
}

