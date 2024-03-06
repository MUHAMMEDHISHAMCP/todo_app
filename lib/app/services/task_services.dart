import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/app/controller/task_controller.dart';
import 'package:todo_app/app/model/task_model.dart';

class TaskServices{

static addTasks(TaskModel data)async{
final taskDB = await Hive.openBox<TaskModel>('task_db');
taskDB.put(data.id,data);
getAlltasks();
}


static deleteTask(String id)async{
final taskDB = await Hive.openBox<TaskModel>('task_db');
taskDB.delete(id);
getAlltasks();
}
static getAlltasks()async{
final getTaskDb = await Hive.openBox<TaskModel>('task_db');
Get.put(TaskController()).getDatas(data: getTaskDb.values);
}
}