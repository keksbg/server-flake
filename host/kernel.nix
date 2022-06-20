{ config, lib, pkgs, ... }:

{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
    };
    initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "ahci" "sd_mod" "sr_mod" ];
  };
}
