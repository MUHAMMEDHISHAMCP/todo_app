import 'package:hive_flutter/adapters.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel{
@HiveField(1)
String? id;
@HiveField(2)
String? tasks;
 TaskModel({
  required this.id,
  required this.tasks
 });
}