import 'package:get/route_manager.dart';
import 'package:rohittest/view/splash/splash_binding.dart';
import 'package:rohittest/view/splash/splash_view.dart';
import 'package:rohittest/view/todo/todo_bindings.dart';
import 'package:rohittest/view/todo/todo_screen.dart';
part 'app_routes.dart';

/// Contains the list of pages or routes taken across the whole application.
/// This will prevent us in using context for navigation. And also providing
/// the blocs required in the next named routes.
///
/// [pages] : will contain all the pages in the application as a route
/// and will be used in the material app.
/// Will be ignored for test since all are static values and would not change.
class AppPages {
  static var transitionDuration = const Duration(
    milliseconds: 250,
  );

  static String initial =  Routes.splash;

  static final pages = [
    GetPage<dynamic>(
      name: _Paths.splash,
      transitionDuration: transitionDuration,
      page: SplashView.new,
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: _Paths.todoScreen,
      transitionDuration: const Duration(
        seconds: 1,
      ),
      page: ToDoScreen.new,
      binding: TodoBindings(),
      transition: Transition.topLevel,
    ),
  ];
}
