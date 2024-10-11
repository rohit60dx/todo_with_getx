import 'package:get/route_manager.dart';

import 'app_pages.dart';

abstract class AppRouteMaps {
  static void goToTodoScreen() {
    Get.offAllNamed(Routes.todoScreen);
  }
}
