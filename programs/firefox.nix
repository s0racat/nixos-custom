{
  programs.firefox = {
    enable = true;
    languagePacks = [ "ja" ];
    autoConfig = ''
      // Use LANG environment variable to choose locale
      // https://gitlab.archlinux.org/archlinux/packaging/packages/firefox/-/blob/72e20d2777ce1f68e57dbffbb16026be43411b82/PKGBUILD#L210-211
      pref("intl.locale.requested", "");
    '';
    policies = {
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "normal_installed";
        };
        "tridactyl.vim.betas.nonewtab@cmcaine.co.uk" = {
          install_url = "https://tridactyl.cmcaine.co.uk/betas/nonewtab/tridactyl_no_new_tab_beta-latest.xpi";
          installation_mode = "normal_installed";
        };
      };
      SearchEngines.Default = "DuckDuckGo";
    };
    preferences = {
                     "dom.security.https_only_mode" = true;
          # Turn off disk cache
          "browser.cache.disk.enable" = false;
          "browser.startup.homepage_override.mstone" = "ignore";
          # Disable Sponsored shortcuts
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          # Do not open "Firefox Privacy Policy" tab in first launch
          "datareporting.policy.firstRunURL" = "";
          "privacy.trackingprotection.enabled" = true;          
# Disable telemetry
          "toolkit.telemetry.enabled" = false;
          "app.shield.optoutstudies.enabled" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "media.ffmpeg.vaapi.enabled" = lib.mkIf pkgs.stdenv.isLinux true;
          # disable av1 by default
          "media.av1.enabled" = false;
          # https://wiki.mozilla.org/Media/block-autoplay
          "media.autoplay.blocking_policy" = 2;
    };
  };
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/chrome" = "firefox.desktop";
      "text/html" = "firefox.desktop";
      "application/x-extension-htm" = "firefox.desktop";
      "application/x-extension-html" = "firefox.desktop";
      "application/x-extension-shtml" = "firefox.desktop";
      "application/xhtml+xml" = "firefox.desktop";
      "application/x-extension-xhtml" = "firefox.desktop";
      "application/x-extension-xht" = "firefox.desktop";
    };
  };
}
