{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nixcord.homeManagerModules.nixcord
  ];

  programs.nixcord = {
    enable = true;
    vesktop.enable = true;
    discord.enable = false;
  };
}
