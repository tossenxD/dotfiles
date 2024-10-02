{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gnome.nautilus
    ranger
  ];
}
