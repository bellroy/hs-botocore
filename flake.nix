{
  inputs = {
    bellroy-nix-foss.url = "github:bellroy/bellroy-nix-foss";
  };

  outputs = inputs:
    inputs.bellroy-nix-foss.lib.haskellProject {
      src = ./.;
      supportedCompilers = [ "ghc92" "ghc94" "ghc96" ];
      defaultCompiler = "ghc94";
    };
}
