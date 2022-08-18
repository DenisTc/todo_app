import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AnalyticsService {
  AnalyticsService({FirebaseAnalytics? firebaseAnalytics})
      : _firebaseAnalytics = firebaseAnalytics ?? FirebaseAnalytics.instance;

  final FirebaseAnalytics _firebaseAnalytics;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _firebaseAnalytics);

  setLogEvent(String log) async {
    try {
      await _firebaseAnalytics.logEvent(name: log);
      if (kDebugMode) {
        print(log);
      }
    } catch (err) {
      if (kDebugMode) {
        Logger().e('error while setting log event (analytics): $err');
      }
    }
  }

  setCurrentScreen(String screenName) {
    try {
      _firebaseAnalytics.setCurrentScreen(screenName: screenName);
    } catch (err) {
      if (kDebugMode) {
        Logger().e('error while setting current screen (analytics): $err');
      }
    }
  }
}
