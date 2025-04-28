{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
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
  home.packages = [
    pkgs.kicad
    #pkgs.vesktop
    pkgs.webcord-vencord
    pkgs.thefuck
    pkgs.prismlauncher
    pkgs.obsidian
    pkgs.urbanterror
    pkgs.digital
    pkgs.clang
    pkgs.nodejs
    pkgs.yarn
    pkgs.bottles
    pkgs.onedriver
    pkgs.teams-for-linux
  ];
  home.sessionVariables = {
    _JAVA_AWT_WM_NONREPARENTING = "1";
    _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true";
    NIXOS_OZONE_WL = "1";
  };
  programs.tofi = {
    enable = true;
    settings = {
      border-width = 0;
      outline-width = 0;
      font-size = 14;
      width = "35%";
      height = "35%";
    };
  };
}
