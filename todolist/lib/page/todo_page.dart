import 'package:flutter/material.dart';
import '../custom_widgets/appbar.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: "Search",
                  border: InputBorder.none,
                ),
              ),
            ),

            // batas
            SizedBox(height: 20),
            Text(
              "All to-do :",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),

            // batas
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                // Card -1
                child: Column(
                  children: [
                    // todo 1
                    Card(
                      color: Colors.purple.shade50,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Checkbox(value: true, onChanged: null),
                        title: Text("go to library at 8 am"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.edit),
                            SizedBox(width: 16),
                            Icon(Icons.delete),
                          ],
                        ),
                      ),
                    ),

                    // todo 2
                    Card(
                      color: Colors.purple.shade50,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Checkbox(value: true, onChanged: null),
                        title: Text(
                          "lorem ipsum dolor si amet blablabla bla bla bla bla bla bla",
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.edit),
                            SizedBox(width: 16),
                            Icon(Icons.delete),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
