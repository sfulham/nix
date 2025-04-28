{
  lib,
  config,
  pkgs,
  inputs,
  system,
  ...
}:
{
  home.packages = with pkgs; [
    lua-language-server
    nil
    elmPackages.elm-language-server
    rust-analyzer
    ltex-ls
    templ
    go
    gopls
    python311Packages.python-lsp-server
    pyright
    nodePackages_latest.svelte-language-server
    prettierd
    pylyzer
    vhdl-ls
    jdt-language-server
    # clipboard support
    wl-clipboard

    # needed by treesitter
    clang
    clang-tools

    # formatters
    stylua
    nixfmt-rfc-style

    bat
    # Diff engine for code actions
    delta
    ripgrep
  ];
  catppuccin.nvim.enable = false;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/home/programs/nvim-conf";
    recursive = true;
  };
}
