{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.textfox.homeManagerModules.default
  ];
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;

      ExtensionSettings = {
        "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
        # uBlock Origin:
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        # Bitwarden
        #"{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
        #  install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
        #  installation_mode = "force_installed";
        #};
        # BPC
        "magnolia@12.34" = {
          install_url = "https://gitflic.ru/project/magnolia1234/bpc_uploads/blob/raw?file=bypass_paywalls_clean-latest.xpi";
          installation_mode = "force_installed";
        };
        # Tridactyl:
        "tridactyl.vim@cmcaine.co.uk" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/tridactyl-vim/latest.xpi";
          installation_mode = "force_installed";
        };
        # 1Password:
        "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
        "haii@willowyx.dev" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/uwuify-doer/latest.xpi";
          installation_mode = "force_installed";
        };
        "firefox@tampermonkey.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/tampermonkey/latest.xpi";
          installation_mode = "force_installed";
        };
        "{0a2d1098-69a9-4e98-a62c-a861766ac24d}" = {
          install_url = "https://github.com/catppuccin/firefox/releases/download/old/catppuccin_mocha_pink.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };

  textfox = {
    enable = true;
    profile = "default";
    useLegacyExtensions = false;
    config = {
      tabs.horizontal.enable = true;
    };
  };
}
