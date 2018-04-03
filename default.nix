with import <nixpkgs> {}; {
  handeEnv = stdenv.mkDerivation {
    name = "dockerfiles";
    buildInputs = [
      clang-tools
      python3
      python35Packages.yapf
      travis
    ];
  };
}
