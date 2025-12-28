{
  description = "NixOS configuration for rmbp laptop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    opnix = {
      url = "github:brizzbuzz/opnix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, deploy-rs, opnix, ... }: {
    nixosConfigurations = {
      rmbp = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/rmbp/configuration.nix
          opnix.nixosModules.default
        ];
      };
    };

    deploy.nodes.rmbp = {
      hostname = "192.168.1.45";
      profiles.system = {
        sshUser = "florent";
        user = "root";
        path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.rmbp;
        remoteBuild = true;
      };
    };
  };
}
