import 'dart:async';

bool? completerExtensions;

extension CompleterExt on Completer<dynamic> {
  void safeComplete<T>([FutureOr<T>? value]) {
    if (!isCompleted) {
      complete(value);
    }
  }
}
