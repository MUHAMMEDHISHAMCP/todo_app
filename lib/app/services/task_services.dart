import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/app/controller/task_controller.dart';
import 'package:todo_app/app/model/task_model.dart';

class TaskServices{

static addTasks(TaskModel data)async{
final taskDB = await Hive.openBox<TaskModel>('task_db');
taskDB.add(data);
getAlltasks();
}


static deleteTask(int id)async{
final taskDB = await Hive.openBox<TaskModel>('task_db');
taskDB.deleteAt(id);
getAlltasks();
}
static getAlltasks()async{
final getTAskDb = await Hive.openBox<TaskModel>('task_db');
Get.put(TaskController()).getDatas(data: getTAskDb.values);
}
}