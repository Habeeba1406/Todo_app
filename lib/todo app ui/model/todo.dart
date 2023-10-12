import 'package:flutter/material.dart';

class Todo {
  String? id;
  String? todotext;
  bool isDone;
  Todo({
    required this.id,
    required this.todotext,
    this.isDone = false,
  });
  static List<Todo> todoList() {
    return [
      Todo(id: '01', todotext: 'Morning Excercise', isDone: true),
      Todo(id: '02', todotext: 'Buy Groceries', isDone: true),
      Todo(
        id: '03',
        todotext: 'Check Emails',
      ),
      Todo(
        id: '04',
        todotext: 'Team Meetig',
      ),
      Todo(
        id: '05',
        todotext: 'Work on mobile apps for 2 hour',
      ),
      Todo(
        id: '06',
        todotext: 'Dinner with Jenny',
      ),
    ];
  }
}
