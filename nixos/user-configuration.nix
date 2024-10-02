{ config, pkgs, lib, ... }: {
  imports =
    [
      programs/browsers.nix
      programs/editors.nix
      programs/imgs.nix
      programs/terminals.nix
      programs/vpns.nix
      programs/filemanagers.nix
      programs/pdfs.nix
      programs/vms.nix
      programs/vpns.nix
      programs/wms.nix
    ];
  options = {
    tb.enable = lib.mkEnableOption "enables user tb";
  };

  config = lib.mkIf config.tb.enable {
    users.users.tb = {
      isNormalUser = true;
      description = "Thorbjørn";
      extraGroups = [ "networkmanager" "wheel" "video" "vboxusers" ];
    };
  };
}
