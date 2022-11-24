import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/controller/task_controller.dart';
import 'package:todo_app/app/screens/home/widgets/todo_list.dart';
import 'package:todo_app/app/services/task_services.dart';
import 'package:todo_app/constant/colors.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
final controller = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {

    controller.onInit();
    return 
         Scaffold(
          appBar: AppBar(
            backgroundColor: bgColor,
            elevation: 0,
            title: const Text(
              'All Todos',
              style: TextStyle(color: kBlack),
            ),
          ),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoSearchTextField(
                // controller: value.searchController,
                backgroundColor: Colors.grey.shade200,
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: kBlack,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: kBlack),
              ),
            ),
            const Expanded(
              child: TodoList(),
            ),
          ]),
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    height: 60,
                    decoration: const BoxDecoration(color: bgColor, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0)
                    ]),
                    child:  TextField(
                      controller: controller.adingControleer,
                      decoration: const InputDecoration(
                          hintText: 'Add Tasks', border: OutlineInputBorder()),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: (){
                   controller.addTasks(context);
                    FocusScope.of(context).requestFocus( FocusNode());
                    controller.adingControleer.clear();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(color: Colors.green, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0)
                    ]),
                    child: const Icon(Icons.check),
                  ),
                )
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
      
    
  }
}
