import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

Logger log = kDebugMode
    ? Logger(
        printer: PrettyPrinter(),
      )
    : Logger(
        printer: PrettyPrinter(),
        level: Level.off,
      );
