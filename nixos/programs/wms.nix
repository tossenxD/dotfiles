{ config, pkgs, ... }: {
  # Packages
  environment.systemPackages = with pkgs; [
    sway
    slurp
    grim
    swappy
    wl-clipboard
    waybar
    workstyle
    wofi
  ];

  # Options
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    xwayland = { enable = true; };
  };
  programs.waybar.enable = true;
  xdg.portal.wlr.enable = true; # allows screensharing on sway
}
