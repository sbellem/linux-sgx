# the last successful build of nixos-unstable - 2020-07-01
#with import (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/55668eb671b915b49bcaaeec4518cc49d8de0a99.tar.gz) {};
#{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-19.09.tar.gz") {} }:
#with pkgs;
with import (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/10e61bf5be57736035ec7a804cb0bf3d083bf2cf.tar.gz) {};
#{ pkgs ? import <nixpkgs> {} }:
#with pkgs;

stdenvNoCC.mkDerivation {
  name = "sgx-build-nix";
  buildInputs = [
    autoconf
    automake
    libtool
    ocaml
    ocamlPackages.ocamlbuild
    file
    cmake
    gnum4
    openssl
    ##openssl-1.1.1b-dev
    gnumake

    #linuxHeaders

    #glibc
    #binutils-unwrapped
    #gcc8
    /nix/store/681354n3k44r8z90m35hm8945vsp95h1-glibc-2.27
    /nix/store/1kl6ms8x56iyhylb2r83lq7j3jbnix7w-binutils-2.31.1
    /nix/store/lvwq3g3093injr86lm0kp0f61k5cbpay-gcc-wrapper-8.3.0

    texinfo
    bison
    flex
    #zlib
    #/nix/store/raiq8qv61rc66arg3vzyfr9kw83s7dwv-autoconf-2.69
    #/nix/store/7bsq9c4z657hddv60hpks48ws699y0fc-automake-1.16.1
    #/nix/store/idj0yrdlk8x49f3gyl4sb8divwhfgjvp-libtool-2.4.6
    #/nix/store/68yb6ams241kf5pjyxiwd7a98xxcbx0r-ocaml-4.06.1
    #/nix/store/ncqmw9iybd6iwxd4yk1x57gvs76k1sq4-ocamlbuild-0.12.0
    #/nix/store/9dkhfaw1qsmvw4rv1z1fqgwhfpbdqrn0-file-5.35
    #/nix/store/vs700jsqx2465qr0x78zcmgiii0890n3-cmake-3.15.5
    #/nix/store/d0fv0g4vcv4s0ysa81pn9sf6fy4zzjcv-gnum4-1.4.18
    #/nix/store/ljvpvjh36h9x2aaqzaby5clclq4mgdmc-openssl-1.1.1b
    #/nix/store/0klr6d4k2g0kabkamfivg185wpx8biqv-openssl-1.1.1b-dev
    #/nix/store/yg76yir7rkxkfz6p77w4vjasi3cgc0q6-gnumake-4.2.1
    #/nix/store/5lyvydxv0w4f2s1ba84pjlbpvqkgn1ni-linux-headers-4.19.16
    #/nix/store/681354n3k44r8z90m35hm8945vsp95h1-glibc-2.27
    #/nix/store/1kl6ms8x56iyhylb2r83lq7j3jbnix7w-binutils-2.31.1
    #/nix/store/lvwq3g3093injr86lm0kp0f61k5cbpay-gcc-wrapper-8.3.0
    #/nix/store/dmxxhhl5yr92pbl17q1szvx34jcbzsy8-texinfo-6.5
    #/nix/store/g6c80c9s2hmrk7jmkp9przi83jpcs8c6-bison-3.5.4
    #/nix/store/qh2ppjlz4yq65cl0vs0m2h57x2cjlwm4-flex-2.6.4 
    #&& nix-env --set-flag priority 10 binutils-2.31.1 \
  ];
  
  shellHook = ''
  echo "SGX build enviroment"
  '';
}
