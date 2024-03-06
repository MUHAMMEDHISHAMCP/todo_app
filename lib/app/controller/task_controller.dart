import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/model/task_model.dart';
import 'package:todo_app/app/services/task_services.dart';

class TaskController extends GetxController {
  final taskList = <TaskModel>[].obs;
  final taskTextController = TextEditingController();
  RxBool isDone = false.obs;
  void addTasks(context) async {
    if (taskTextController.text.isEmpty ||
        taskTextController.text.trim() == null) {
      return;
    }

    final TaskModel task = TaskModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        tasks: taskTextController.text,
        isDone: false);

    TaskServices.addTasks(task);
    print(task.tasks);
  }

  void deleteTAsk(String id) {
    if (id.isEmpty) {
      return;
    }
    TaskServices.deleteTask(id);
    //  getDatas(data: id);
  }

  void getDatas({required data}) {
    if (data == null) {
      print('===### No data ## ');
      return;
    }
    taskList.clear();
    taskList.addAll(data);
    // taskList.reversed;
  }

  void onComleted(String id, String tasks, bool isDn) {
    final task = TaskModel(id: id, tasks: tasks, isDone: isDn);
    TaskServices.addTasks(task);
  }

  @override
  void onInit() {
    // getDatas(data: taskList);
    TaskServices.getAlltasks();
    super.onInit();
  }
}
