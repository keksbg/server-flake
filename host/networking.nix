{ config, ... }:

{
  networking = {
    useDHCP = false;
    interfaces.ens18.useDHCP = true;
    nameservers = [ "1.1.1.1" "1.0.0.1" ];
  };
}
