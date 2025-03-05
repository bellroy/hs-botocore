{
  inputs = {
    bellroy-nix-foss.url = "github:bellroy/bellroy-nix-foss";
  };

  outputs = inputs:
    inputs.bellroy-nix-foss.lib.haskellProject {
      src = ./.;
      supportedCompilers = [ "ghc8107" "ghc92" "ghc912" "ghc94" ];
      defaultCompiler = "ghc94";
    };
}
