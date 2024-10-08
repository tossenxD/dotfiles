{ configs, pkgs, ... }: {
  # Packages
  environment.systemPackages = with pkgs; [
    emacs
    vim
    neovim
    cura
    libreoffice
    gimp
  ];
  
  # Options
  services.emacs.enable = true;
}
