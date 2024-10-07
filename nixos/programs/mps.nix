{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    spotify
    playerctl
  ];
  programs.steam.enable = true;
}
