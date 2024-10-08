{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Haskell
    ghc
    stack
    # Python
    python3
    # GCC
    libgcc
    # Futhark
    futhark
    # TeX
    texliveTeTeX
  ];
}
