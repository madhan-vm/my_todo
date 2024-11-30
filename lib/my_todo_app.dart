// import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MyTodoApp extends StatefulWidget {
  const MyTodoApp({super.key});

  @override
  State<MyTodoApp> createState() => _MyTodoAppState();
}

class _MyTodoAppState extends State<MyTodoApp> {
  final List<String> taskList = [
    "Flutter",
    "Web Devlopment",
    "Cricket",
    "Hotsar",
    "Hotsar",
    "Hotsar",
    "Hotsar",
    "Kaththi",
    "Thalapthy",
    "GOAT"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: TodoList(taskList),
    );
  }
}

class TodoList extends StatefulWidget {
  TodoList(this.list, {super.key});

  final List<String> list;
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (ctx, index) => ListTile(
              key: ValueKey(widget.list[index]),
              title: TodoCard(widget.list[index]),
            ));
  }
}

class TodoCard extends StatefulWidget {
  TodoCard(this.text, {super.key});
  final String text;

  @override
  State<TodoCard> createState() {
    return _TodoCardState();
  }
}

class _TodoCardState extends State<TodoCard> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              colors: [Colors.lightGreenAccent, Colors.cyanAccent])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value;
                });
              }),
          Text(widget.text),
        ],
      ),
    );
  }
}
