# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.nodePackages.firebase-tools
    pkgs.jdk17
    pkgs.sdkmanager
    pkgs.android-tools
  ];
  # Sets environment variables in the workspace
  env = {};
  idx = {
    workspace = {
      onCreate = {
        # Recommend making this change upstream. The samples seem to be using a very old version of gradle
        upgrade-gradle = "cd tutorials/java/MapWithMarker/ && ./gradlew wrapper --gradle-version 8.7";
      };
    };
    previews = {
      enable = true;
      previews = [
        {
          command = ["./.flutter-sdk/flutter/bin/flutter" "run" "--machine" "-d" "android" "-d" "localhost:5555"];
          id = "android";
          manager = "flutter";
        }
      ];
    };
  };
}
