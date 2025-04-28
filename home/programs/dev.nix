{
  inputs,
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.gnumake
    pkgs.pkg-config
    pkgs.gmp
    pkgs.json_c
    pkgs.openssl
    pkgs.nasm
  ];

  xdg.configFile."containers/registries.conf".text = ''
    [registries.search]
    registries = ['docker.io']
  '';
  xdg.configFile."containers/policy.json".text = ''
    {
      "default": 
      [
          {
              "type": "insecureAcceptAnything"
          }
      ],
      "transports":
      {
          "docker-daemon":
          {
              "": [{"type":"insecureAcceptAnything"}]
          }
      }
    }
  '';
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };
}
