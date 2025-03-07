{
    inputs, pkgs, ...
}:
{
    imports = 
    [
        inputs.catppuccin.homeManagerModules.catppuccin
        ./home/core
        ./home/programs
    ];
    home.username = "charli";
    home.homeDirectory = "/home/charli";
 
    home.stateVersion = "24.11";

    programs.home-manager.enable = true;

    programs.wofi.enable = true;    
    programs.ghostty.enable = true;
    catppuccin.enable = true;
    catppuccin.flavor = "mocha";
    home.sessionVariables.NIXOS_OZONE_WL = "1";
    home.packages =
    [
        pkgs.kicad
        pkgs.vesktop
        pkgs.thefuck
        pkgs.prismlauncher
        pkgs.obsidian
        pkgs.urbanterror
        pkgs.digital
        pkgs.clang
        pkgs.nodejs
        pkgs.yarn
    ];
    programs.tofi =
    {
        enable = true;
        settings =
        {
            border-width = 0;
            outline-width = 0;
            font-size = 14;
            width = "35%";
            height = "35%";
        };
    };
} 
