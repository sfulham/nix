{
    inputs, pkgs, lib, ...
}:
{
    #programs._1password.enable = true;
    #programs._1password-gui = {
    #    enable = true;

    #    polkitPolicyOwners = [ "charli" ];
    #};

    imports = [ inputs._1password-shell-plugins.hmModules.default ];
    programs._1password-shell-plugins = {
        enable = true;
        plugins = with pkgs; [ gh awscli2 ];
    };

    programs.ssh =
    {
        enable = true;
        extraConfig = ''
            Host *
            IdentityAgent ~/.1password/agent.sock
        '';
    };
    programs.git = {
        enable = true;
        userName = "Charlotte Fulham";
        userEmail = "u7917382@anu.edu.au";
        extraConfig =
        {
            gpg =
            {
                format = "ssh";
            };
            "gpg \"ssh\"" =
            {
                program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
            };
            commit =
            {
                gpgsign = true;
            };

            user = {
                signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHPelz6LjOykg6M1UY0QCG5KOckvg5Wl/nZjk+Me67Cr";
            };
        };
    };
}
