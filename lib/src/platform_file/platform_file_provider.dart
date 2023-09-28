import 'platform_file_stub.dart'
    if (dart.library.js) 'platform_file_web.dart'
    if (dart.library.io) 'platform_file_mobile.dart';

mixin PlatformFileProvider {
  static PlatformFileHelperImp provide() => PlatformFileHelperImp();
}
