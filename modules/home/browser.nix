{pkgs, ...}: {
  programs.firefox = {
    enable = true;

    profiles = {
      kopa = {
        isDefault = true;

        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          bitwarden
          darkreader
          sponsorblock
          ublock-origin
        ];

        settings = {
          # Show previous session on startup (2 = restore session)
          "browser.startup.page" = 2;

          # Remember zoom level per site
          "browser.zoom.siteSpecific" = true;

          # Cookie persistence behavior
          "network.cookie.lifetimePolicy" = 0; # Accept cookies normally
          "privacy.clearOnShutdown.cookies" = false; # Don't clear cookies on shutdown
          "privacy.clearOnShutdown.siteSettings" = false; # Keep site permissions/settings
          "privacy.sanitize.sanitizeOnShutdown" = false; # Disable general auto-cleanup

          # Needed for proper zoom and feature behavior — disables anti-fingerprinting zoom locking
          "privacy.resistFingerprinting" = false;

          # URL bar autocomplete behavior
          "browser.urlbar.autoFill" = true; # Autocomplete URLs as you type
          "browser.urlbar.dnsFirstForSingleWords" = true; # Resolve single words as domains if possible

          # Enable suggestions in the address bar
          "browser.urlbar.suggest.history" = true; # Suggest URLs from history
          "browser.urlbar.suggest.bookmark" = true; # Suggest bookmarks
          "browser.urlbar.suggest.openpage" = true; # Suggest open tabs
          "browser.urlbar.suggest.searches" = true; # Suggest search engine suggestions

          # Enable search suggestions in the search bar
          "browser.search.suggest.enabled" = true;

          # Disable password saving prompt
          "signon.rememberSignons" = false;
          "passwordmanager.enabled" = false;

          # Remove the "Firefox View" button/tab
          "browser.tabs.firefox-view" = false;

          # Disable Pocket integration (saves articles to Firefox Account)
          "extensions.pocket.enabled" = false;

          # Remove ads and sponsored content from new tab page
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

          # Disable news/top stories from Mozilla on new tab page
          "browser.newtabpage.activity-stream.feeds.system.topstories" = false;

          # (Optional additions if you want a clean new tab page)
          # Disable highlights like recent history and bookmarks
          # "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
          # "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
          # "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
        };

        search = {
          force = true;
          default = "ddg";
          order = [
            "searxng"
            "nix-packages"
            "nixos-wiki"
            "ddg"
          ];

          engines = {
            searxng = {
              urls = [
                {template = "https://searx.org/search?q={searchTerms}";}
              ];
              icon = "https://searx.org/favicon.ico";
              updateInterval = 86400000; # 24h
              definedAliases = ["@searx"];
              suggestUrls = [
                {template = "https://searx.org/autosuggest?q={searchTerms}";}
              ];
            };

            "nix-packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages?type=packages&query={searchTerms}";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "https://nixos.wiki/favicon.png";
              definedAliases = ["@np"];
            };

            "nixos-wiki" = {
              urls = [
                {template = "https://nixos.wiki/index.php?search={searchTerms}";}
              ];
              icon = "https://nixos.wiki/favicon.png";
              updateInterval = 86400000;
              definedAliases = ["@nw"];
            };

            ddg = {
              urls = [
                {template = "https://duckduckgo.com/?q={searchTerms}";}
              ];
              definedAliases = ["@ddg"];
            };

            # Hide Bing from the UI
            bing.metaData.hidden = true;

            # Give Google an alias
            google.metaData.alias = "@g";
          };
        };
      };
    };
  };
}
