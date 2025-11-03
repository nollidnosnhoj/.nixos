{
  inputs,
  pkgs,
  # self,
  # username,
  ...
}: let
  # profilePicture = "${self}/.assets/profile.png";
  # wallpaperDir = "${self}/.assets/wallpapers";
  # wallpaper = "${self}/.assets/wallpapers/wallhaven-k8w7dq.png";
in {
  # systemd
  imports = [
    inputs.noctalia.nixosModules.default
  ];

  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${system}.default
  ];

  # home-manager.users.${username} = {
  #   imports = [
  #     inputs.noctalia.homeModules.default
  #   ];

  #   programs.noctalia-shell.enable = true;
  #   programs.noctalia-shell.settings = {
  #     appLauncher = {
  #       backgroundOpacity = 1;
  #       enableClipboardHistory = true;
  #       pinnedExecs = [];
  #       position = "center";
  #       sortByMostUsed = true;
  #       useApp2Unit = false;
  #     };
  #     audio = {
  #       cavaFrameRate = 60;
  #       mprisBlacklist = [];
  #       preferredPlayer = "";
  #       visualizerType = "linear";
  #       volumeStep = 5;
  #     };
  #     bar = {
  #       backgroundOpacity = 1;
  #       density = "compact";
  #       floating = false;
  #       marginHorizontal = 0.25;
  #       marginVertical = 0.25;
  #       monitors = [];
  #       position = "top";
  #       showCapsule = false;
  #       widgets = {
  #         center = [
  #           {
  #             hideUnoccupied = false;
  #             id = "Workspace";
  #             labelMode = "none";
  #           }
  #         ];
  #         left = [
  #           {
  #             customIconPath = "";
  #             icon = "";
  #             id = "ControlCenter";
  #             useDistroLogo = true;
  #           }
  #           {
  #             id = "WiFi";
  #           }
  #           {
  #             id = "Bluetooth";
  #           }
  #           {
  #             displayMode = "onhover";
  #             id = "Volume";
  #           }
  #         ];
  #         right = [
  #           {
  #             id = "Tray";
  #           }
  #           {
  #             displayMode = "onhover";
  #             id = "Battery";
  #             warningThreshold = 30;
  #           }
  #           {
  #             id = "ScreenRecorder";
  #           }
  #           {
  #             formatHorizontal = "HH:mm";
  #             formatVertical = "HH mm";
  #             id = "Clock";
  #             useMonospacedFont = true;
  #             usePrimaryColor = true;
  #           }
  #           {
  #             hideWhenZero = true;
  #             id = "NotificationHistory";
  #             showUnreadBadge = false;
  #           }
  #         ];
  #       };
  #     };
  #     brightness = {
  #       brightnessStep = 5;
  #     };
  #     colorSchemes = {
  #       darkMode = true;
  #       predefinedScheme = "Nord";
  #       useWallpaperColors = false;
  #     };
  #     dock = {
  #       enabled = true;
  #       displayMode = "always_visible";
  #       backgroundOpacity = 1;
  #       floatingRatio = 1;
  #       size = 1;
  #       onlySameOutput = true;
  #       monitors = [];
  #       pinnedApps = [];
  #       colorizeIcons = false;
  #     };
  #     general = {
  #       animationSpeed = 1;
  #       avatarImage = profilePicture;
  #       dimDesktop = true;
  #       forceBlackScreenCorners = false;
  #       radiusRatio = 1;
  #       screenRadiusRatio = 1;
  #       showScreenCorners = false;
  #     };
  #     hooks = {
  #       darkModeChange = "";
  #       enabled = false;
  #       wallpaperChange = "";
  #     };
  #     location = {
  #       name = "Ewa Beach";
  #       showWeekNumberInCalendar = false;
  #       use12hourFormat = false;
  #       useFahrenheit = true;
  #     };
  #     matugen = {
  #       enableUserTemplates = false;
  #       foot = false;
  #       fuzzel = false;
  #       ghostty = false;
  #       gtk3 = false;
  #       gtk4 = false;
  #       kitty = false;
  #       pywalfox = false;
  #       qt5 = false;
  #       qt6 = false;
  #       vesktop = false;
  #     };
  #     network = {
  #       bluetoothEnabled = true;
  #       wifiEnabled = true;
  #     };
  #     nightLight = {
  #       autoSchedule = false;
  #       dayTemp = "6500";
  #       enabled = true;
  #       forced = false;
  #       manualSunrise = "06:30";
  #       manualSunset = "18:30";
  #       nightTemp = "4000";
  #     };
  #     notifications = {
  #       criticalUrgencyDuration = 15;
  #       doNotDisturb = false;
  #       lastSeenTs = 1758498577000;
  #       location = "top_right";
  #       lowUrgencyDuration = 3;
  #       monitors = [
  #       ];
  #       normalUrgencyDuration = 8;
  #     };
  #     screenRecorder = {
  #       audioCodec = "opus";
  #       audioSource = "default_output";
  #       colorRange = "limited";
  #       directory = "home/${username}/Videos";
  #       frameRate = 60;
  #       quality = "very_high";
  #       showCursor = true;
  #       videoCodec = "h264";
  #       videoSource = "portal";
  #     };
  #     settingsVersion = 3;
  #     ui = {
  #       fontBillboard = "Inter";
  #       fontDefault = "Roboto";
  #       fontFixed = "ComicShannsMono Nerd Font";
  #       idleInhibitorEnabled = false;
  #       monitorsScaling = [
  #       ];
  #     };
  #     wallpaper = {
  #       directory = wallpaperDir;
  #       enableMultiMonitorDirectories = false;
  #       enabled = true;
  #       fillColor = "#000000";
  #       fillMode = "crop";
  #       monitors = [
  #         {
  #           directory = wallpaperDir;
  #           name = "eDP-1";
  #           wallpaper = wallpaper;
  #         }
  #         {
  #           directory = wallpaperDir;
  #           name = "DP-2";
  #           wallpaper = wallpaper;
  #         }
  #       ];
  #       randomEnabled = false;
  #       randomIntervalSec = 300;
  #       setWallpaperOnAllMonitors = true;
  #       transitionDuration = 1500;
  #       transitionEdgeSmoothness = {
  #       };
  #       transitionType = "random";
  #     };
  #   };
  # };
}
