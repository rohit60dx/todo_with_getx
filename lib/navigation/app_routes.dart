// coverage:ignore-file
part of 'app_pages.dart';

/// routes in [AppPages].
abstract class Routes {
  static const splash = _Paths.splash;
  static const todoScreen = _Paths.todoScreen;
}

abstract class _Paths {
  static const splash = '/splash';
  static const todoScreen = '/todoScreen';
}
