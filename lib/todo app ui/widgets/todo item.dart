import 'package:flutter/material.dart';
import 'package:my_practises/todo%20app%20ui/constants/colors.dart';
import 'package:my_practises/todo%20app%20ui/model/todo.dart';

class Todoitem extends StatelessWidget {
  final Todo todo;
  final onTodoChanged;
  final onDeleteitem;

  const Todoitem({
    Key? key,
    required this.todo,
    required this.onTodoChanged,
    required this.onDeleteitem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: () {
            //print("Clicked on Todo item");
            onTodoChanged(todo);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.white,
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: tdblue,
          ),
          title: Text(
            todo.todotext!,
            style: TextStyle(
              fontSize: 16,
              color: tdblack,
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: tdred, borderRadius: BorderRadius.circular(5)),
            child: IconButton(
                onPressed: () {
                  onDeleteitem(todo.id);
                },
                iconSize: 18,
                icon: Icon(
                  Icons.delete,
                  color: Colors.black,
                )),
          ),
        ));
  }
}
