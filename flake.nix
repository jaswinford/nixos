{
  description = "Nix configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    stylix.url = "github:danth/stylix";
    nixos-wsl.url = "github:nix-community/nixos-wsl";
    agenix.url = "github:ryantm/agenix";
  };

  outputs = {
    self,
    home-manager,
    nixpkgs,
    stylix,
    agenix,
    nixos-wsl,
    ...
  } @ inputs: let
    globalModules = [
      {system.configurationRevision = self.rev or self.dirtyRev or null;}
      stylix.nixosModules.stylix
      home-manager.nixosModules.home-manager
      agenix.nixosModules.default
      ./modules/global/global.nix
      ./modules/stylix
      ./modules/neovim
      ./modules/tmux
      ./modules/fonts
      ./modules/zsh
      ./users/adam
      ./scripts
      ./groups
    ];
  in {
    nixosConfigurations = {
      # Workstations
      Freyr = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules =
          globalModules
          ++ [
            {networking.hostName = "Freyr";}
            {environment.systemPackages = [inputs.agenix.packages."x86_64-linux".default];}
            "${self}/machines/freyr"
            "${self}/modules/i3"
            "${self}/modules/wireless"
            "${self}/modules/tailscale"
            "${self}/modules/workstation"
            ./modules/syncthing
          ];
      };
      wx-001 = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules =
          globalModules
          ++ [
            {networking.hostName = "wx-001";}
            {environment.systemPackages = [inputs.agenix.packages."x86_64-linux".default];}
            "${self}/machines/wx-001"
            "${self}/modules/i3"
            "${self}/modules/tailscale"
            "${self}/modules/sunshine"
            "${self}/modules/workstation"
            ./modules/syncthing
            ./modules/nfs-client
          ];
      };
      # Work WSL instance
      IEL-100123 = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules =
          globalModules
          ++ [
            {wsl.wslConf.network.hostname = "IEL-100123";}
            {networking.interfaces.eth0.mtu = 1000;}
            {environment.systemPackages = [inputs.agenix.packages."x86_64-linux".default];}
            nixos-wsl.nixosModules.default
            "${self}/machines/iel-100123"
            "${self}/modules/devops"
            "${self}/modules/tailscale"
            "${self}/modules/workstation"
            ./modules/syncthing
          ];
      };
      # Servers
      soft-serve = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules =
          globalModules
          ++ [
            {networking.hostName = "soft-serve";}
            {environment.systemPackages = [inputs.agenix.packages."x86_64-linux".default];}
            "${self}/machines/lxc"
            "${self}/modules/soft-serve"
          ];
      };
      nextcloud = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules =
          globalModules
          ++ [
            {networking.hostName = "nextcloud";}
            {environment.systemPackages = [inputs.agenix.packages."x86_64-linux".default];}
            "${self}/machines/lxc"
            "${self}/modules/nextcloud"
            ./modules/nfs-client
          ];
      };
      rproxy = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules =
          globalModules
          ++ [
            {networking.hostName = "rproxy";}
            {environment.systemPackages = [inputs.agenix.packages."x86_64-linux".default];}
            "${self}/machines/lxc"
            "${self}/modules/rproxy"
          ];
      };
      silverbullet = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules =
          globalModules
          ++ [
            {networking.hostName = "silverbullet";}
            {environment.systemPackages = [inputs.agenix.packages."x86_64-linux".default];}
            "${self}/machines/lxc"
            "${self}/modules/silverbullet"
            "${self}/modules/tailscale"
          ];
      };
      web1 = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules =
          globalModules
          ++ [
            {networking.hostName = "web1";}
            {environment.systemPackages = [inputs.agenix.packages."x86_64-linux".default];}
            "${self}/machines/lxc"
            "${self}/modules/5etools"
          ];
      };
      aria = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules =
          globalModules
          ++ [
            {networking.hostName = "aria";}
            {environment.systemPackages = [inputs.agenix.packages."x86_64-linux".default];}
            "${self}/machines/lxc"
            "${self}/modules/aria2"
            "${self}/modules/tailscale"
            {networking.hosts = {"100.114.232.112" = ["fs01" "fs01.jadam.local"];};}
          ];
      };
      fs01 = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules =
          globalModules
          ++ [
            {networking.hostName = "fs01";}
            {environment.systemPackages = [inputs.agenix.packages."x86_64-linux".default];}
            "${self}/machines/lxc"
            "${self}/modules/nfs-server"
            "${self}/modules/tailscale"
          ];
      };
      mysql = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules =
          globalModules
          ++ [
            {networking.hostName = "mysql";}
            {environment.systemPackages = [inputs.agenix.packages."x86_64-linux".default];}
            "${self}/modules/mysql"
            "${self}/machines/lxc"
          ];
      };
    };
  };
}
