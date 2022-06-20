{ config, inputs, modules, overlays, pkgs, ... }:

{
  networking.hostName = "nix-plex";
  system.stateVersion = "22.05";
  time.timeZone = "Europe/Rome";

  imports = with modules.system; [
    inputs.home-manager.nixosModule
    home-manager

    base
    nix
    packages
    piracy
    security
    ./filesystem.nix
    ./kernel.nix
    ./networking.nix

    ../users/stateless
  ];
}
