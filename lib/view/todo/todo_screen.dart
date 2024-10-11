// ignore_for_file: library_private_types_in_public_api, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rohittest/appstyle/app_colors.dart';
import 'package:rohittest/appstyle/app_dimensions.dart';
import 'package:rohittest/appstyle/app_extentions.dart';
import 'package:rohittest/appstyle/app_spacing.dart';
import 'package:rohittest/appstyle/text_box_decoration.dart';
import 'package:rohittest/view/todo/todo_controller.dart';

class ToDoScreen extends StatelessWidget {
  ToDoScreen({super.key});

  var dsh = Get.isRegistered<TodoController>()
      ? Get.find<TodoController>()
      : Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('ToDo List')
                .regularText(AppColors.blackColor, AppDimensions.d20),
          ),
          body: Column(
            children: [
              _searchTextFormField(controller),
              _toDoList(controller)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.titleController.clear();
              controller.descriptionController.clear();
              controller.addTaskDialog(context);
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  Widget _searchTextFormField(TodoController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.d10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpacing.h10,
          SizedBox(
            width: double.infinity,
            height: AppDimensions.d60.h,
            child: TextFormField(
              controller: controller.searchController,
              decoration: ViewDecoration.inputDecorationWithCurve(
                  "Search", AppColors.whiteColor,
                  borderColor: AppColors.colorE0E0E0,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                        left: AppDimensions.d16.w, right: AppDimensions.d6.w),
                    child: const Icon(
                      Icons.search,
                      color: AppColors.color828282,
                    ),
                  )),
              onChanged: (query) {
                controller.onSearchChanged(query);
              },
            ),
          ),
          AppSpacing.h10,
        ],
      ),
    );
  }

  Widget _toDoList(TodoController controller) {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.toDoList.length,
        itemBuilder: (context, index) {
          final todo = controller.toDoList[index];
          return ListTile(
            title: Text(
              todo.title,
              style: TextStyle(
                decoration: todo.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            subtitle:
                todo.description == "" ? Container() : Text(todo.description),
            leading: Checkbox(
              value: todo.isDone,
              onChanged: (bool? value) {
                controller.toggleToDoItem(todo);
              },
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    controller.titleController.text = todo.title;
                    controller.descriptionController.text = todo.description;
                    controller.editTaskdialogBox(
                      context,
                      todo,
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    controller.deleteToDoItem(todo);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
