import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/model/task_model.dart';
import 'package:todo_app/app/services/task_services.dart';

class TaskController extends GetxController {
  final taskList = <TaskModel>[].obs;
  final adingControleer = TextEditingController();
  void addTasks(context) async {
    if (adingControleer.text.isEmpty) {
      return;
    }
    final TaskModel ss = TaskModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        tasks: adingControleer.text);

    TaskServices.addTasks(ss);
    print(ss.tasks);
  }

  void getDatas({required data}){
  if (data ==null) {
    return;
  }
  taskList.clear();
  taskList.addAll(data);
  taskList.reversed;
  }

  @override
  void onInit() {
    getDatas(data: taskList);
    super.onInit();
  }
}
