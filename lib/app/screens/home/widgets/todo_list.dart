import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/controller/task_controller.dart';
import 'package:todo_app/app/services/task_services.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});


  @override
  Widget build(BuildContext context) {
    final controller =  Get.put(TaskController());
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: Obx(
        () => 
         ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final value = controller.taskList.value[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child:  Card(
              elevation: 4,
              child: ListTile(
               leading: Icon(Icons.check_box),
               title: Text(value.tasks.toString()),
               trailing: IconButton(onPressed: (){
                if (controller.taskList[index].id == null) {
                  print(null);
                  return;
                }
                                  print(controller.taskList[index].id);

                // TaskServices.deleteTask(controller.taskList[index].id);
               }, icon: Icon(Icons.delete)),
              ),
            ),
          );
        },
        itemCount: controller.taskList.length,),
      ),
    );
  }
}