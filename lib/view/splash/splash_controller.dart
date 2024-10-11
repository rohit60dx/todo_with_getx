import 'package:get/get.dart';
import 'package:rohittest/navigation/app_route_maps.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    Future.delayed(
      const Duration(
        seconds: 1,
      ),
      () {
        AppRouteMaps.goToTodoScreen();
      },
    );

    super.onInit();
  }
}
