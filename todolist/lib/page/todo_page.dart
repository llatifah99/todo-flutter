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
  List<TodoModel> filteredTodos = [];

  @override
  void initState() {
    super.initState();
    filteredTodos = List.from(todos);
  }

  void filterTodos(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTodos = List.from(todos);
      } else {
        filteredTodos = todos.where((todo) {
          return todo.title.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  void showEditDialog(int index) {
    final controller = TextEditingController(text: todos[index].title);
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: const EdgeInsets.all(16),
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
                          backgroundColor: const Color.fromARGB(
                            255,
                            150,
                            74,
                            162,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            todos[index].title = controller.text;
                          });
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
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

  void showAddDialog() {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: EdgeInsets.all(16),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Add new todo:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text("Enter your new task below:"),
                  SizedBox(height: 10),
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(hintText: "e.g. study english"),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cancel"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        onPressed: () {
                          if (controller.text.trim().isNotEmpty) {
                            setState(() {
                              todos.insert(
                                0,
                                TodoModel(title: controller.text.trim()),
                              );
                            });
                          }
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
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
            CustomSearchBar(onChanged: filterTodos),
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
                itemCount: filteredTodos.length,
                itemBuilder: (context, index) {
                  final todo = filteredTodos[index];
                  return CardTodo(
                    todo: todo,
                    onToggle: (value) {
                      setState(() {
                        final todo = filteredTodos[index];
                        todo.isDone = value!;
                      });
                    },
                    onEdit: () {
                      showEditDialog(index);
                    },
                    onDelete: () {
                      setState(() {
                        final todo = filteredTodos[index];
                        todos.remove(todo);
                        filteredTodos.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
