import 'package:flutter/material.dart';
import '../custom_widgets/appbar.dart';
import '../custom_widgets/searchbar.dart';
import '../custom_widgets/cardTodo.dart';
import '../model/todo_model.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<TodoModel> todos = [
    TodoModel(title: "Go to library at 8 am", isDone: true),
    TodoModel(title: "Buy groceries", isDone: false),
  ];

  void showEditDialog(int index) {
    final controller = TextEditingController(text: todos[index].title);
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: const EdgeInsets.all(16), // 👈 margin dari tepi layar
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Edit ToDo",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text("Update your task below:"),
                  const SizedBox(height: 10),
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(hintText: "Enter todo title"),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple.shade50,
                        ),
                        onPressed: () {
                          setState(() {
                            todos[index].title = controller.text;
                          });
                          Navigator.pop(context);
                        },
                        child: const Text("Save"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // search bar
            CustomSearchBar(),
            // batas
            SizedBox(height: 20),
            Text(
              "All to-do :",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            // batas
            SizedBox(height: 10),
            // todo List
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return CardTodo(
                    todo: todos[index],
                    onToggle: (value) {
                      setState(() {
                        todos[index].isDone = value!;
                      });
                    },
                    onEdit: () {
                      showEditDialog(index);
                    },
                    onDelete: () {
                      setState(() {
                        todos.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
