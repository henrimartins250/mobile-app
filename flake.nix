{
  description = "❄️A Nix flake for a Flutter and Android development environment.❄️";

  inputs = {
    # Nixpkgs is the primary source of packages.
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      # Use a specific system architecture, here x86_64-linux.
      # You can change this to match your system (e.g., aarch64-darwin for M1/M2 Mac).
      supportedSystem = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${supportedSystem};

    in {
      devShells.${supportedSystem}.default = pkgs.mkShell {
        # The buildInputs contain the main tools for the development environment.
        buildInputs = with pkgs; [
          # Flutter SDK
          flutter

          # Android tools:
          # `android-tools` provides `adb`, `fastboot`, etc.
          # `androidsdk` provides the SDK components. We pin a specific version of the command-line tools.
          android-tools
          (pkgs.androidsdk.compose {
            build-tools = "34.0.0";
            cmdline-tools = "latest";
            platforms = [ "android-34" ];
            platform-tools = "latest";
          })

          # Java Development Kit required by Android Studio and Flutter.
          # Using OpenJDK 17, which is a common requirement.
          (jdk.override {
            jre = pkgs.zulu_17;
          })

          # Standard development tools
          git # Flutter requires git
          unzip
        ];

        # Set environment variables so the tools can find each other.
        # This is crucial for Flutter to locate the Android SDK.
        shellHook = ''
          echo "Setting up Flutter and Android environment..."

          # Set ANDROID_HOME.
          # The `androidsdk` package puts everything in a sub-directory, so we point to it.
          export ANDROID_HOME=$PWD/.android-sdk

          # Add the necessary Android SDK components to the PATH.
          export PATH=$PATH:$ANDROID_HOME/platform-tools
          export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
          export PATH=$PATH:$ANDROID_HOME/build-tools/34.0.0

          # Provide some common commands for the user.
          echo "❄️Environment set up successfully.❄️"
          echo "📱Run 'flutter doctor' to verify the installation.📱"
          echo "✔️Run 'sdkmanager --licenses' to accept the Android SDK licenses.✔️"
          echo "If 'flutter doctor' still shows issues, you may need to manually install additional SDK components with 'sdkmanager'."
        '';
      };
    };
}
