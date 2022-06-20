{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    curl
    git
    htop
    neovim
    wget
  ];
  environment.variables.EDITOR = "nvim";
  services.vnstat.enable = true;
}
