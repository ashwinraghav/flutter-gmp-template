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
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        npm-install = "./gradlew :app:installDebug";
      };
      # To run something each time the environment is rebuilt, use the `onStart` hook
    };
  };
}
