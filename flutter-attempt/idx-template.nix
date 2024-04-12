{ pkgs, apikey ? "missingkey", giturl ? "missingurl", subdir ? "", launchactivity ? "",... }: {
  packages = [
      pkgs.git
      pkgs.sdkmanager
      pkgs.j2cli
  ];
  bootstrap = ''
    flutter create "$WS_NAME"
    mv "$WS_NAME" "$out"
  '';
}
