import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/controller/task_controller.dart';
import 'package:todo_app/app/services/task_services.dart';
import 'package:todo_app/constant/colors.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TaskController());
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: Obx(
        () => controller.taskList.value.isEmpty
            ? const Center(
                child: Text(
                  'Add Your Tasks',
                  style: TextStyle(
                      fontSize: 25, color: kBlack, fontWeight: FontWeight.bold),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final value = controller.taskList.value[index];
                  return Slidable(
                    endActionPane:
                        ActionPane(motion: StretchMotion(), children: [
                      SlidableAction(
                        onPressed: (context) {
                          TaskServices.deleteTask(value.id!);
                        },
                        icon: Icons.delete_sharp,
                        backgroundColor: Colors.red,
                      )
                    ]),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Card(
                        elevation: 4,
                        child: ListTile(
                          leading: IconButton(
                              onPressed: () {
                                controller.onComleted(
                                    value.id ?? '',
                                    value.tasks ?? "",
                                    value.isDone == true ? false : true);
                              },
                              icon: Icon(value.isDone == true
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank)),
                          title: Text(
                            value.tasks.toString(),
                            style: TextStyle(
                              decoration: value.isDone == true
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                print(value.id);
                                TaskServices.deleteTask(value.id!);
                              },
                              icon: const Icon(Icons.delete)),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: controller.taskList.length,
              ),
      ),
    );
  }
}
