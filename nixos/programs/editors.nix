{ configs, pkgs, ... }: {
  # Packages
  environment.systemPackages = with pkgs; [
    emacs
    vim
    neovim
    cura
    libreoffice
    gimp
    openscad
    prusa-slicer
    freecad
    inkscape
  ];
  
  # Options
  services.emacs.enable = true;
}
