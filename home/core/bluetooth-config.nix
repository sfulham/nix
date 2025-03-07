{
  inputs,
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.bluetui
    pkgs.pulsemixer
  ];
}
