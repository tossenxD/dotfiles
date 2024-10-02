{ configs, pkgs, ... }: {
  # Packages
  environment.systemPackages = with pkgs; [
    emacs
    vim
    neovim
  ];
  
  # Options
  services.emacs.enable = true;
}
