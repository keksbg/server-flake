{ lib }:
let
  getName = path: lib.removeSuffix ".nix" (
    lib.last (
      lib.splitString "/" (
        builtins.toString path
      )
    )
  );
  mkAttrsFromPaths = paths: builtins.listToAttrs (
    builtins.map
      (path: {
        name = getName path;
        value = path;
      })
      paths
  );
in
{
  system = mkAttrsFromPaths [
    ./system/base.nix
    ./system/home-manager.nix
    ./system/nix.nix
    ./system/packages.nix
    ./system/piracy.nix
    ./system/security.nix
  ];
  user = mkAttrsFromPaths [
    ./user/neovim-minimal.nix
    ./user/sessionVariables.nix
    ./user/zsh.nix
  ];
}
