{
  description = "A flake for compiling test programs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
  };

  outputs = { self, nixpkgs }:
  let pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in {

		devShells."x86_64-linux".default = pkgs.mkShell {
  	name = "SimularyrTempsReel";
  	packages = with pkgs; [
    	gcc
    	llvmPackages.clang-tools
    	just

    	(python313.withPackages (ps: with ps; [
    	  pip
    	  pandas
    	  matplotlib
    	  jupyterlab
    	  notebook
    	]))
    	vscodium
  	];
    hardeningDisable = [ "fortify" ];

		};
  };
}
