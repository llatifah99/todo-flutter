import 'package:flutter/material.dart';
import '../custom_widgets/appbar.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar());
  }
}
