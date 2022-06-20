{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    zsh-abbr = { url = "github:olets/zsh-abbr"; flake = false; };
    zsh-history-substring-search = { url = "github:zsh-users/zsh-history-substring-search"; flake = false; };
    fast-syntax-highlighting = { url = "github:zdharma-continuum/fast-syntax-highlighting"; flake = false; };
    pure = { url = "github:sindresorhus/pure"; flake = false; };
  };

  outputs = { self, nixpkgs, ... } @ inputs:
    let
      overlays = (import ./overlays);
      mkSystem =
        nixpkgs: arch: nixpkgs.lib.nixosSystem {
          system = arch;
          modules = [
            { nixpkgs.overlays = overlays; }
            (./host)
          ];
          specialArgs = {
            inherit inputs;
            modules = import ./modules { lib = nixpkgs.lib; };
          };
        };
      in
      {
        nixosConfigurations."nix-plex" = mkSystem nixpkgs "x86_64-linux";
        packages."x86_64-linux" = import nixpkgs {
          inherit overlays;
          system = "x86_64-linux";
        };
      };
}
