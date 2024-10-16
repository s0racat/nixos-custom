{ pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
  };
  fonts.enableDefaultPackages = false;
  fonts.packages = with pkgs;[ ipaexfont roboto-mono];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "IPAexMincho" ];
      sansSerif = [ "IPAexGothic" ];
      monospace = ["Roboto Mono"];
    };
  };
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    keepassxc
  ];
  environment.xfce.excludePackages = with pkgs.xfce; [
    parole
  ];

  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
      xfce.enableScreensaver = false;
    };
  };
  services.displayManager.defaultSession = "xfce";

  # remove mbrola
  services.speechd.enable = false;
  boot.plymouth.enable = lib.mkImageMediaOverride false;
  # services.xserver.enable = lib.mkImageMediaOverride false;
  # programs.sway = {
  #   enable = true;
  #   wrapperFeatures.gtk = true;
  #   extraPackages = with pkgs; [
  #     foot
  #     dmenu
  #     wmenu
  #     wl-clipboard
  #   ];
  # };

  # pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  # TODO: cannot start fcitx5 on sway
  # TODO: settings
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-skk
        fcitx5-gtk
      ];
      waylandFrontend = true;
    };
  };
  time.timeZone = "Asia/Tokyo";
  networking.networkmanager.enable = lib.mkImageMediaOverride true; # Easiest to use and most distros use this by default.
  programs.firefox = {
    enable = true;
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
      # Confirm when downloading files
      "browser.download.always_ask_before_handling_new_types" = true;
      # Do not save passwords
      "signon.rememberSignons" = false;
      # Enable HTTPS-Only Mode in all windows
      "dom.security.https_only_mode" = true;
      # Turn off disk cache
      "browser.cache.disk.enable" = false;
      # Do not show warning when opening about:config
      "browser.aboutConfig.showWarning" = false;
      # Disable firefox intro tabs on the first start
      "browser.startup.homepage_override.mstone" = "ignore";
      # Disable Sponsored shortcuts
      "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      # Do not open "Firefox Privacy Policy" tab in first launch
      "datareporting.policy.firstRunURL" = "";
      # Enable user{Chrome,Content}.css
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      # Tracking protection
      "privacy.trackingprotection.enabled" = true;
      # WebRTC LAN IP Address
      "media.peerconnection.ice.default_address_only" = true;
      # Disable connection tests
      "network.captive-portal-service.enabled" = false;
      # Disable telemetry
      "toolkit.telemetry.enabled" = false;
      "app.shield.optoutstudies.enabled" = false;
      "datareporting.healthreport.uploadEnabled" = false;
      # Display bookmarks above search suggestions
      "browser.urlbar.showSearchSuggestionsFirst" = false;
      # Enable Tab Unloading feature
      "browser.tabs.unloadOnLowMemory" = true;
      # Enable fractional scaling via fractional-scale-v1 protocol 
      # "widget.wayland.fractional-scale.enabled" = true;
      # Bring back old Clear All History dialog
      "privacy.sanitize.useOldClearHistoryDialog" = true;
      # Enable verticalTabs
      "sidebar.revamp" = true;
      "sidebar.verticalTabs" = true;
      # Disable pocket
      "extensions.pocket.enabled" = false;
      # Dark theme
      "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
      # set homepage to about:home
      "browser.startup.homepage" = "about:home";
      # force enable vaapi
      "media.ffmpeg.vaapi.enabled" = true;
      # disable av1
      "media.av1.enabled" = false;
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
  services.gvfs.enable = true;
  services.tlp = {
    enable = true;
  };
  services.logind.powerKey = "suspend";
  boot.consoleLogLevel = 3;
  boot.tmp.useTmpfs = true;
  services.udisks2 = {
    enable = true;
    settings = {
      "tcrypt.conf" = { };
    };
  };
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
  users.users.nixos.shell = pkgs.zsh;
  home-manager.users.nixos = import ./home.nix;
}
