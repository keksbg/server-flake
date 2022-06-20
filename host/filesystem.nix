{ config, ... }:
let
  mkBtrfsMount = subvol: extraOptions:
    {
      device = "/dev/disk/by-uuid/170ef25d-950c-478e-9064-2bec330b5e88";
      fsType = "btrfs";
      options = [ "subvol=${subvol}" "compress=zstd" ] ++ extraOptions;
    };
in
{
  fileSystems = {
    "/" = {
      device = "tmpfs";
      fsType = "tmpfs";
    };

    "/nix" = mkBtrfsMount "nix" [ "noatime" ];
    "/home" = mkBtrfsMount "home" [];
    "/persist" = mkBtrfsMount "persist" [];

    "/boot" = {
      device = "/dev/disk/by-uuid/5C79-CD79";
      fsType = "vfat";
    };
  };
}
