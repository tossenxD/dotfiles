{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Haskell
    ghc
    stack
    # Python
    python3
    # Futhark
    futhark
    # TeX
    texliveTeTeX
    # C/C++
    libclang
    clang-tools
    cmake
  ];
}
