import 'package:BlueGame/src/helpers/index.dart';

Future<void> reportError(dynamic error, dynamic stackTrace) async {
  if (isDebugMode) {
    // print the full stacktrace in debug mode
    print(stackTrace);
  } else {
    // send the error and exception on production via error handler moduels
  }
}
