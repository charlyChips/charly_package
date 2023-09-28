import 'package:flutter/foundation.dart';

import 'platform_file.dart';

class PlatformFileHelperImp implements PlatformFileHelper {
  @override
  void share(List<int> bytes, {String? filename}) {
    debugPrint('shareStubFile');
  }
}
