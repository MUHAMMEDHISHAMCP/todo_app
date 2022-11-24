import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/model/task_model.dart';
import 'package:todo_app/app/services/task_services.dart';

class TaskController extends GetxController {
  final taskList = <TaskModel>[].obs;
  final adingControleer = TextEditingController();
  RxBool isDone = false.obs;
  void addTasks(context) async {
    if (adingControleer.text.isEmpty || adingControleer.text.trim() == null) {
      return;
    }

    final TaskModel ss = TaskModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        tasks: adingControleer.text,
        isDone: false);
   
    TaskServices.addTasks(ss);
    // getDatas(data: ss);
    print(ss.tasks);
  }

  void deleteTAsk(String id){
     if (id.isEmpty) {
       return;
     }
     TaskServices.deleteTask(id);
    //  getDatas(data: id);
  }
  void getDatas({required data}){
  if (data ==null) {
    print('object');
    return;
  }
  taskList.clear();
  taskList.addAll(data);
  // taskList.reversed;
  }

 void onComleted(String id,String tasks,bool isDn){
  final ss = TaskModel(id: id, tasks: tasks,isDone: isDn);
  TaskServices.addTasks(ss);
  }

  @override
  void onInit() {
    // getDatas(data: taskList);
    TaskServices.getAlltasks();
    super.onInit();
  }
}
