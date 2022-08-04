import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class RemoteConfigService {
  late FirebaseRemoteConfig firebaseRemoteConfig;

  RemoteConfigService._();
  static final RemoteConfigService _singleton = RemoteConfigService._();
  static RemoteConfigService get instance => _singleton;

  void initRemoteConfig() {
    firebaseRemoteConfig = FirebaseRemoteConfig.instance;
  }

  Color? getPrimaryColor() {
    final data = firebaseRemoteConfig.getString('primary_color');
    final hexColor = data.replaceAll('#', '0xff');
    final primaryColor = Color(int.parse(hexColor));

    return primaryColor;
  }
}
