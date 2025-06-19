import 'package:flutter/material.dart';
import '../model/todo_model.dart';

class CardTodo extends StatelessWidget {
  final TodoModel todo;
  final Function(bool?) onToggle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CardTodo({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple.shade50,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Checkbox(value: todo.isDone, onChanged: onToggle),
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.isDone
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: todo.isDone ? Colors.grey : Colors.black,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(onTap: onEdit, child: const Icon(Icons.edit)),
            const SizedBox(width: 16),
            GestureDetector(onTap: onDelete, child: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
