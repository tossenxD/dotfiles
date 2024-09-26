{ configs, pkgs, ... }:

{
  # Packages
  environment.systemPackages = with pkgs; [
    emacs
  ];
  
  # Options
  services.emacs.enable = true;
}
