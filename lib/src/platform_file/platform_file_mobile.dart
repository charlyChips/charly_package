import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'platform_file.dart';

// [share_plus](https://pub.dev/packages/share_plus) | flutter pub add share_plus 6.3.4
// [path_provider](https://pub.dev/packages/path_provider) | flutter pub add path_provider
class PlatformFileHelperImp implements PlatformFileHelper {
  @override
  void share(List<int> bytes, {String? filename}) {
    debugPrint('Sharing file $filename');

    // On Flutter, use the [path_provider](https://pub.dev/packages/path_provider) library:
    getApplicationDocumentsDirectory()
        .then((output) => File("${output.path}/$filename"))
        .then((file) => file.writeAsBytes(bytes))
        .then((fileReady) =>
            Share.shareFiles([fileReady.path], text: 'Reporte $filename'));
  }
}
