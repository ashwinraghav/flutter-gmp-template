{ pkgs, apikey ? "missingkey", giturl ? "missingurl",... }: {
      packages = [
			pkgs.git
      pkgs.sdkmanager
    ];
  bootstrap = ''
    mkdir -p "$WS_NAME"
    
    git clone --depth 1 ${giturl} $WS_NAME
    echo ${apikey} > "$WS_NAME/apikey.txt"
    chmod -R +w "$WS_NAME"
    mkdir -p "$WS_NAME/.idx/"
    # Recommend commiting the dev.nix files to the upstream repo directly.
    cp -rf ${./dev.nix} "$WS_NAME/.idx/dev.nix"
    mv "$WS_NAME" "$out"
  '';
}
