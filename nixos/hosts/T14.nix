{ config, pkgs, ... }: {
  imports =
    [
      ./hardware-configuration-T14.nix
      ../configuration.nix
    ];
  networking.hostName = "T14";
  tb.enable = true;
  boot.loader.grub.splashImage = ../../common/wallpapers/thankpad.png;
}
