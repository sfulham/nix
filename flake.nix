{
  description = "Charli's system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    catppuccin.url = "github:catppuccin/nix";
    textfox.url = "github:adriankarlen/textfox";
    _1password-shell-plugins.url = "github:1Password/shell-plugins";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      catppuccin,
      hyprpanel,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.charlis-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          vars.user = "charli";
        };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          catppuccin.nixosModules.catppuccin
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
          { nixpkgs.overlays = [ inputs.hyprpanel.overlay ]; }
        ];
      };
    };
}
