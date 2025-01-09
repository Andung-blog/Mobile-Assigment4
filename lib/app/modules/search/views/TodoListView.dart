import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/search/controllers/search_explore_controller.dart';

class TodoListView extends GetView<SearchExploreController> {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchExploreController controller = Get.find<SearchExploreController>();
    final TextEditingController todoController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do List"),
        backgroundColor: const Color(0xFF21005D),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: todoController,
              decoration: InputDecoration(
                hintText: 'Enter new to-do item...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add, color: Color(0xFF21005D)),
                  onPressed: () {
                    if (todoController.text.isNotEmpty) {
                      controller.addTodoItem(todoController.text);
                      todoController.clear();
                    }
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.todoList.length,
                itemBuilder: (context, index) {
                  final todo = controller.todoList[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      title: Text(
                        todo['title'] ?? '',
                        style: TextStyle(
                          fontSize: 18,
                          decoration: todo['status'] == 'Completed'
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      subtitle: Text('Status: ${todo['status']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              Get.dialog(
                                AlertDialog(
                                  title: const Text('Edit To-Do'),
                                  content: TextField(
                                    controller: TextEditingController(text: todo['title']),
                                    onSubmitted: (value) {
                                      if (value.isNotEmpty) {
                                        controller.updateTodoItem(index, value);
                                        Get.back();
                                      }
                                    },
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Get.back(),
                                      child: const Text('Cancel'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              controller.deleteTodoItem(index);
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        controller.toggleTodoStatus(index);
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
