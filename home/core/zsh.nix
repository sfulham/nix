{
  inputs,
  pkgs,
  ...
}:
{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "1password"
        "battery"
        "git"
        "command-not-found"
        "extract"
        "fzf"
        "rust"
        "thefuck"
      ];
    };
    syntaxHighlighting = {
      enable = true;
    };
    plugins = [
      {
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.4.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
    ];
    shellAliases = {
      "ls" = "ls -la";
      "nix-config" = "nvim ~/.config/nix";
      "nix-reload" = "sudo nixos-rebuild switch --flake ~/.config/nix#charlis-laptop";
      "cd" = "z";
    };
    initContent = ''
      # This function is called whenever a command is not found.
      #  command_not_found_handler() {
      #    local p=${pkgs.comma}/bin/comma
      #    if [ -x $p ]; then
      # Run the helper program.
      #      $p "$@"
      #    else
      # Indicate than there was an error so ZSH falls back to its default handler
      #     echo "$1: command not found" >&2
      #     return 127
      #   fi
      #  }
      hyfetch
      #'';
  };
  programs.fzf = {
    enable = true;
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.yazi = {
    enable = true;
  };
  programs.starship = {
    enable = true;
  };
  programs.hyfetch = {
    enable = true;
    settings = {
      "preset" = "transgender";
      "mode" = "rgb";
      "light_dark" = "dark";
      "lightness" = 0.65;
      "color_align" = {
        "mode" = "horizontal";
        "custom_colors" = [ ];
        "fore_back" = null;
      };
      "backend" = "fastfetch";
      "args" = null;
      "distro" = null;
      "pride_month_shown" = [ ];
      "pride_month_disable" = false;
    };
  };
  programs.fastfetch = {
    enable = true;
  };
}
