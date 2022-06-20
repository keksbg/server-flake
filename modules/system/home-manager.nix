{ config, inputs, modules, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs modules;
      sysConfig = config;
    };
  };
}
