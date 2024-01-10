let channels = rec {
  pkgs = import <nixpkgs> {};
  #pkgs-unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) {};
  #pkgs-master = import (fetchTarball https://github.com/NixOs/nixpkgs/archive/master.tar.gz) { config.allowUnfree = true; };
};
in with channels;

let dependencies = rec {
  _tex = pkgs.texlive.combined.scheme-full;
  _inotify = pkgs.inotify-tools;
};

in with dependencies;


pkgs.stdenv.mkDerivation rec {
  name = "env";
  env = pkgs.buildEnv {
    name = name;
    paths = buildInputs;
  };

  buildInputs = [
    _tex
    _inotify
  ];
}
