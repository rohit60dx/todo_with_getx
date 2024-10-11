
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:rohittest/view/todo/todo_controller.dart';

class TodoBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(TodoController.new);
  }
}
