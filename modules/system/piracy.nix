{ config, pkgs, ... }:

{
  services = {
    nzbget = {
      enable = true;
      user = "media";
      group = "media";
      settings = {
        MainDir = "/home/media/nzbget";
      };
    };

    plex = {
      enable = true;
      user = "media";
      group = "media";
      dataDir = "/home/media/plex";
      openFirewall = true;
    };

    radarr = {
      enable = true;
      user = "media";
      group = "media";
      dataDir = "/home/media/radarr";
      openFirewall = true;
    };

    sonarr = {
      enable = true;
      user = "media";
      group = "media";
      dataDir = "/home/media/sonarr";
      openFirewall = true;
    };

    deluge = {
      enable = true;
      user = "media";
      group = "media";
      declarative = true;
      authFile = "/persist/deluge/auth";
      config = {
        download_location = "/home/media/torrents";
      };
      web.enable = true;
      web.openFirewall = true;
    };

    nzbhydra2 = {
      enable = true;
      dataDir = "/home/media/nzbhydra";
      openFirewall = true;
    };
  };
}
