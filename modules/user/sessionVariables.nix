{ config, ... }:

{
  home.sessionVariables = {
    PATH = builtins.concatStringsSep ":" [
      "${config.home.homeDirectory}/.local/bin"
      "${config.xdg.dataHome}/npm/bin"
      "$PATH"
    ];

    EDITOR = "nvim";
  };
}
