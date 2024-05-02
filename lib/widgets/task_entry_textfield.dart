//todo write this class so that it reflects the right widget

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeit/data/tasks_data.dart';

class TaskEntry extends StatelessWidget {
  TaskEntry({super.key});
  final submitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //* Text field decoration -[start]---------------------------------------
    InputDecoration myTextFieldDecoration = InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      hintText: "Enter your task here",
      // suffixIcon: IconButton(
      //   icon: Icon(Icons.add),
      //   onPressed: () {
      //     Provider.of<TaskData>(context).addNewTask(submitController.text);
      //   },
      // )
      //  fillColor: Colors.grey[200]; // Optional background color
    );
    //* Text field decoration -[end]---------------------------------------

    return Consumer<TaskData>(builder: (context, taskData, child) {
      return Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            autofocus: true,
            controller: submitController,
            decoration: myTextFieldDecoration,
            textInputAction: TextInputAction.go,
            onSubmitted: taskData.addNewTask,
          ));
    });
  }
}
