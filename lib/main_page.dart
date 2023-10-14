import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_project/todo_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _todoBox = Hive.box<TodoModel>('todos');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(' Todo List'),
          centerTitle: true,
        ),
        body: ValueListenableBuilder(
          valueListenable: _todoBox.listenable(),
          builder: (context, Box<TodoModel> box, child) {
            return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  final todo = box.getAt(index)!;
                  return TodoListTile(
                    todo: todo,
                    index: index,
                    ondelete: _deleteTodo,
                  );
                });
          },
        ),
        floatingActionButton: customFloatingActioButton(
          onpressed: _addTodo,
        ));
  }

//add todo
  void _addTodo(String description) {
    final todo = TodoModel(description: description);
    _todoBox.add(todo);
  }

//delete todo
  void _deleteTodo(int index) {
    _todoBox.deleteAt(index);
  }
}
