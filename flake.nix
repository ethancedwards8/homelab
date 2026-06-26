{
  description = "Ethan's Homelab";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ self, nixpkgs, ... }:
    let
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
    in
    {
      devShell = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        with pkgs;
        mkShell {
          buildInputs = [
            git
            nixfmt
            opentofu

            cf-terraforming
          ];
        }
      );
    };
}
