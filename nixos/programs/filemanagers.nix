{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    ranger
    kdePackages.dolphin
    kdePackages.qtwayland
    kdePackages.qtsvg
  ];
  services.gvfs.enable = true;
}
