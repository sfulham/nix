{
    inputs, pkgs, ...
}:
{
    programs.vscode =
    {
        enable = true;
        package = pkgs.vscodium;
        extensions = with inputs.nix-vscode-extensions.extensions."x86_64-linux"; [
            vscode-marketplace.anu-extensions.comp2300-extension
            vscode-marketplace.catppuccin.catppuccin-vsc
            vscode-marketplace.anu-extensions.quac-companion
        ];
    };
}
