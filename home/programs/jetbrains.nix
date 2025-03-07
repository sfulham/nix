{
  inputs,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    jetbrains.rust-rover
    cargo
    rustc
  ];
}
