{ pkgs ? import <nixpkgs> { config = {
	android_sdk.accept_license = true;
	allowUnfree = true;
}; } }: with pkgs; mkShell {
	packages = [
		androidenv.androidPkgs.platform-tools
		apktool
		apkeditor
		openjdk
		imagemagick
		python3
	];
	shellHook = let
		buildToolsVersion = "34.0.0";
		androidComposition = androidenv.composeAndroidPackages {
			buildToolsVersions = [ buildToolsVersion ];
		};
	in ''
		export PATH=$PATH:${androidComposition.androidsdk}/libexec/android-sdk/build-tools/${buildToolsVersion}
	'';
}
