{ config, pkgs, ... }: {
  imports =
    [
      ./browsers.nix
      ./editors.nix
      ./imgs.nix
      ./terminals.nix
      ./vpns.nix
      ./filemanagers.nix
      ./pdfs.nix
      ./vms.nix
      ./vpns.nix
      ./wms.nix
      ./gaming.nix
      ./mps.nix
    ];
}
