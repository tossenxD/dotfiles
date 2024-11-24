{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    cowsay
    unigine-heaven
  ];
}
