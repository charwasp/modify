# modify

Automatic patcher to modify APK.

## Usage

First, you need to install JDK 8 or higher, Android SDK, and Python 3.
Make sure that these commands are available in your PATH:
`java`, `keytool`, `apksigner`, `python`.
Optionally, you can install ImageMagick, and make sure `magick` command is available in your PATH
(for changing the icon).

Then, download the APK files yourself, and place them in the `apk` directory.
If you downloaded an APKX file or an APKS file,
just decompress it as a Zip file, and place the extracted APK files in the `apk` directory.

Then, run the command `python modify.py`.
The patched APK will be saved as `modified.apk`.
You can install it on your Android device (possibly alongside with the original app).

You need to keep the generated keystore `keystore.jks` properly,
because if in the future you want to modify the APK again,
you need to sign it with the same key.

## Configuration

For advanced users, there are some environment variables that you can set to customize the patching process:

- `JAVA_COMMAND`,
- `APKEDITOR_COMMAND`,
- `APKTOOL_COMMAND`,
- `SIGNING_COMMAND`,
- `IMAGEMAGICK_COMMAND`,
- `REPLACEMENT_SERVER_URL`.

Look at the Python code yourself to see what they do
and their default values.

## License

AGPL-3.0-or-later.
