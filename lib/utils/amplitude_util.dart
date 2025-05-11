import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitude_flutter/configuration.dart';
import 'package:amplitude_flutter/events/base_event.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AmplitudeUtil {
  static late Amplitude amplitude;

  static void init() {
    amplitude =
        Amplitude(Configuration(apiKey: dotenv.get('AMPLITUDE_API_KEY')));
  }

  static Future<void> trackEvent({required String eventName}) async {
    if (!kDebugMode) {
      final event = BaseEvent(eventName);
      await amplitude.track(event);
    }
  }

  static Future<void> trackEventWithProperty<T>({
    required String eventName,
    required String propertyName,
    required T propertyValue,
  }) async {
    if (!kDebugMode) {
      final event = BaseEvent(
        eventName,
        eventProperties: {propertyName: propertyValue},
      );
      await amplitude.track(event);
    }
  }

  static Future<void> trackEventWithProperties({
    required String eventName,
    required Map<String, dynamic> properties,
  }) async {
    if (!kDebugMode) {
      final event = BaseEvent(
        eventName,
        eventProperties: properties,
      );
      await amplitude.track(event);
    }
  }

  static Future<void> setUserId({required String userId}) async {
    await amplitude.setUserId(userId);
  }
}
