// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:convert';
import 'dart:html';

import 'platform_file.dart';

class PlatformFileHelperImp implements PlatformFileHelper {
  @override
  void share(List<int> bytes, {String? filename}) {
    print('Sharing file $filename');
    final base64 = base64Encode(bytes);
    // Create the link with the file
    final anchor =
        AnchorElement(href: 'data:application/octet-stream;base64,$base64')
          ..target = 'blank';
    // add the name
    anchor.download = filename;

    // trigger download
    document.body?.append(anchor);
    anchor.click();
    anchor.remove();
    return;
  }
}
