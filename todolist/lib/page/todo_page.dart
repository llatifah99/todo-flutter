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
                      print("edit");
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
