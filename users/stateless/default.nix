{ config, lib, modules, pkgs, ... }:

{
  users.users.diaphanus = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMOCOtko0hLYeIAW79Gv6w2xWkUkiMtnhWtJU9O9kpPS arch" ];
  };

  home-manager.users.diaphanus = { config, lib, pkgs, ... }: {
    home = {
      username = "diaphanus";
      homeDirectory = "/home/diaphanus";
      stateVersion = "22.05";
      keyboard = null;
    };
    imports = with modules.user; [
      neovim-minimal
      sessionVariables
      zsh
    ];
  };
}
