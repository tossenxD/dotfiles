{ config, pkgs, ... }: {
  # This file is meant to be imported on a host machine
  imports = [
    ./system-configuration.nix
    ./user-configuration.nix
  ];
}
