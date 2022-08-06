import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  late FirebaseRemoteConfig firebaseRemoteConfig;

  RemoteConfigService._();
  static final RemoteConfigService _singleton = RemoteConfigService._();
  static RemoteConfigService get instance => _singleton;

  void initRemoteConfig() {
    firebaseRemoteConfig = FirebaseRemoteConfig.instance;
    firebaseRemoteConfig.fetchAndActivate();
  }

  int? getPrimaryColor() {
    final data = firebaseRemoteConfig.getString('primary_color');
    if (data.isNotEmpty) {
      final hexColor = data.replaceAll('#', '0xff');
      final primaryColor = int.parse(hexColor);

      return primaryColor;
    }

    return null;
  }
}
