FROM ubuntu:18.04

RUN apt-get update \
        && apt-get install -y curl python perl git wget vim \
        && mkdir -p /nix /etc/nix \
        && chmod a+rwx /nix \
        && echo 'sandbox = false' > /etc/nix/nix.conf \
        && rm -rf /var/lib/apt/lists/*

#add a user for Nix
RUN adduser user --home /home/user --disabled-password --gecos "" --shell /bin/bash
CMD /bin/bash -l
USER user
ENV USER user
WORKDIR /home/user

#install the required software
RUN touch .bash_profile \
        && curl https://nixos.org/releases/nix/nix-2.2.1/install | sh \
        && . /home/user/.nix-profile/etc/profile.d/nix.sh \
        \
        && nix-env -i /nix/store/681354n3k44r8z90m35hm8945vsp95h1-glibc-2.27 \
        && nix-env -i /nix/store/1kl6ms8x56iyhylb2r83lq7j3jbnix7w-binutils-2.31.1 \
        && nix-env --set-flag priority 10 binutils-2.31.1 \
        && nix-env -i /nix/store/lvwq3g3093injr86lm0kp0f61k5cbpay-gcc-wrapper-8.3.0

#&& nix-env -iA nixpkgs.autoconf \
#&& nix-env -iA nixpkgs.automake \
#&& nix-env -iA nixpkgs.libtool \
#&& nix-env -iA nixpkgs.ocaml \
#&& nix-env -iA nixpkgs.ocamlPackages.ocamlbuild \
#&& nix-env -iA nixpkgs.file \
#&& nix-env -iA nixpkgs.cmake \
#&& nix-env -iA nixpkgs.gnum4 \
#&& nix-env -iA nixpkgs.openssl \
##&& nix-env -i openssl-1.1.1b-dev \
#&& nix-env -iA nixpkgs.gnumake \
#&& nix-env -iA nixpkgs.linuxHeaders \
#
##&& nix-env -iA nixpkgs.glibc \
##&& nix-env -iA nixpkgs.binutils-unwrapped \
##&& nix-env --set-flag priority 20 binutils-2.31.1 \
##&& nix-env -iA nixpkgs.gcc8 \
#
#&& nix-env -i /nix/store/681354n3k44r8z90m35hm8945vsp95h1-glibc-2.27 \
#&& nix-env -i /nix/store/1kl6ms8x56iyhylb2r83lq7j3jbnix7w-binutils-2.31.1 \
#&& nix-env --set-flag priority 10 binutils-2.31.1 \
#&& nix-env -i /nix/store/lvwq3g3093injr86lm0kp0f61k5cbpay-gcc-wrapper-8.3.0 \
#
#&& nix-env -iA nixpkgs.texinfo \
#&& nix-env -iA nixpkgs.bison \
#&& nix-env -iA nixpkgs.flex

COPY sgx.nix /home/user/

#config nix-shell
#RUN . /home/user/.nix-profile/etc/profile.d/nix.sh && nix-shell sgx.nix
