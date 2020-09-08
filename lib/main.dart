import 'dart:async';
import 'dart:io';

import 'package:BlueGame/src/App.dart';
import 'package:BlueGame/src/error/index.dart';
import 'package:BlueGame/src/helpers/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  // here we defined the details for error handling for flutter and dart error
  FlutterError.onError = (FlutterErrorDetails details) {
    /// here we can capture the error msg if any occur during the
    /// build, layout and print phase
    if (isDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode: route towards the application zone
      // so that capture by sentry and send to server
      Zone.current.handleUncaughtError(details.exception, details.stack);
      if (kReleaseMode) {
        /// quit the app -> immediately in release mode
        /// as error occurs
        exit(1);
      }
    }
  };

  runZonedGuarded<Future<void>>(() async {
    runApp(App());
  }, (Object error, StackTrace stackTrace) {
    reportError(error, stackTrace);
  });
}
