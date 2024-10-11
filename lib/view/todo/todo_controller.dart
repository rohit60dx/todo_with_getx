import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rohittest/appstyle/app_colors.dart';
import 'package:rohittest/appstyle/app_dimensions.dart';
import 'package:rohittest/appstyle/app_extentions.dart';
import 'package:rohittest/model/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoController extends GetxController {
  List<ToDo> toDoList = [];
  List<ToDo> filteredToDoList = [];
  TextEditingController searchController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void onInit() {
    _loadToDoList();
    super.onInit();
  }

  Future<void> _loadToDoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? toDoListString = prefs.getString('todo_list');
    if (toDoListString != null) {
      List<dynamic> toDoListJson = jsonDecode(toDoListString);

      toDoList = toDoListJson.map((json) => ToDo.fromJson(json)).toList();
      filteredToDoList =
          toDoListJson.map((json) => ToDo.fromJson(json)).toList();
      update();
    }
  }

  Future<void> _saveToDoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String toDoListString =
        jsonEncode(toDoList.map((todo) => todo.toJson()).toList());
    prefs.setString('todo_list', toDoListString);
  }

  void addToDoItem(String title, String description) {
    toDoList.add(ToDo(
      title: title,
      description: description,
    ));
    _saveToDoList();

    update();
  }

  void toggleToDoItem(ToDo todo) {
    todo.isDone = !todo.isDone;
    _saveToDoList();
    update();
  }

  void deleteToDoItem(ToDo todo) {
    toDoList.remove(todo);
    _saveToDoList();
    update();
  }

  void editToDoItem(ToDo todo, String newTitle, String newDescription) {
    todo.title = newTitle;
    todo.description = newDescription;
    _saveToDoList();
    update();
  }

  void filterToDoList() {
    String query = searchController.text.toLowerCase();
    filteredToDoList = toDoList.where((todo) {
      return todo.title.toLowerCase().contains(query) ||
          todo.description.toLowerCase().contains(query);
    }).toList();
    update();
  }

  void onSearchChanged(String query) {
    debugPrint("query: $query");

    if (query.isEmpty) {
      toDoList = List.from(filteredToDoList);
       update();
    } else {
      toDoList = filteredToDoList
          .where((todo) =>
              (todo.title ?? '').toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    update();
  }

  editTaskdialogBox(BuildContext context, ToDo todo) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit ToDo').boldText(AppColors.blackColor, AppDimensions.d16),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Enter new title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                  hintText: 'Enter new description'), // Add this line
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel').semiBoldText(AppColors.color006FFD, AppDimensions.d12),
          ),
          TextButton(
            onPressed: () {
              editToDoItem(todo, titleController.text,
                  descriptionController.text); // Update this line
              Navigator.pop(context);
            },
            child: const Text('Save').semiBoldText(AppColors.color006FFD, AppDimensions.d12),
          ),
        ],
      ),
    );
  }

  addTaskDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add ToDo').boldText(AppColors.blackColor, AppDimensions.d16),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Enter title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                  hintText: 'Enter description'), // Add this line
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel').semiBoldText(AppColors.color006FFD, AppDimensions.d12),
          ),
          TextButton(
            onPressed: () {
              addToDoItem(titleController.text,
                  descriptionController.text); // Update this line
              Navigator.pop(context);
            },
            child: const Text('Add').semiBoldText(AppColors.color006FFD, AppDimensions.d12),
          ),
        ],
      ),
    );
  }
}
