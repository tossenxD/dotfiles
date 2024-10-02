{ config, pkgs, ... }: {
  imports =
    [
      ./hardware-configuration-apollo69.nix
      ../configuration.nix
    ];
  networking.hostName = "apollo69";
  tb.enable = true;
}
