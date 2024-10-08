{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    firefox
    chromium
  ];

  programs.chromium.extensions = [
    "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    "eimadpbcbfnmbkopoojfekhnkhdbieeh" # dark reader
    "ihennfdbghdiflogeancnalflhgmanop" # gruvbox theme
  ];
  programs.chromium.enable = true;
  programs.chromium.extraOpts = {
    "BrowserSignin" = 0;
    "SyncDisabled" = true;
    "PasswordManagerEnabled" = false;
    "DefaultSearchProviderEnabled" = true;
    "DefaultSearchProviderSearchURL" = "https://duckduckgo.com/?q={searchTerms}";
    "HomepageIsNewTabPage" = true;
    "NewTabPageLocation" = "chrome://dino/";
    "SearchSuggestEnabled" = false;
    "SavingBrowserHistoryDisabled" = true;
  };
}
 
