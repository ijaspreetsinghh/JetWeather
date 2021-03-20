import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-4325421502488315~3152584201";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get nativeAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-4325421502488315~3152584201";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}
