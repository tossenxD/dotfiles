{ config, pkgs, lib, ... }: {
  imports =
    [
      ./system
      ./programs
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
