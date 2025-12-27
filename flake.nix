{
  description = "NixOS configuration for rmbp laptop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, deploy-rs, ... }: {
    nixosConfigurations = {
      rmbp = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/rmbp/configuration.nix
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
