{ config, inputs, modules, overlays, ... }:

{
  i18n.defaultLocale = "en_US.UTF-8";
  users.mutableUsers = false;

  system = {
    configurationRevision = inputs.self.rev;
    nixos = rec {
      version = config.system.nixos.release + versionSuffix;
      versionSuffix = "-${config.system.name}.r${builtins.toString inputs.self.revCount}.${inputs.self.shortRev}";
    };
  };
  nix.registry.config.flake = inputs.self;
  nix.registry.nixpkgs.flake = inputs.nixpkgs;
}
