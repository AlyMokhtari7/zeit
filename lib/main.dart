import 'dart:convert';
// import 'dart:html';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:zeit/styled_text.dart';

// Material You dynamic color
import 'package:dynamic_color/dynamic_color.dart';

import 'package:zeit/providers/task_provider.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  var taskRepo = [
    ['Hi', 'Task'],
    ['Hola', 'Task'],
    ['sect1', 'Section'],
    ['Hallo', 'Task'],
    ['sect2', 'Section'],
  ];
  var finishedTasksRepo = [];

  final submitController = TextEditingController();

  // Reorder method
  void update_myTiles_index(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex--;
      }
      //get the tile we are moving
      final tile = taskRepo.removeAt(oldIndex);
      //Place the tile in the new position
      taskRepo.insert(newIndex, tile);
    });
  }

  void addNewTask(String label) {
    setState(() {
      taskRepo.add([label, "task"]);
      submitController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    // final data = ref.watch(taskProvider);

    // Text field decoration
    InputDecoration myTextFieldDecoration = InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      hintText: "Enter your task here",
      suffixIcon: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          addNewTask(submitController.text);
        },
      ),
      fillColor: Colors.grey[200], // Optional background color
    );

    return MaterialApp(
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.deepOrange),
      home: Scaffold(
        // backgroundColor: Color.fromARGB(255, 34, 40, 49),
        appBar: AppBar(
            // title: const Text("Zeit"),
            // backgroundColor: Color.fromARGB(255, 34, 40, 49),
            titleTextStyle: const TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const StyledText("Task Progress yay hey "),
            const SizedBox(
              width: 250,
              child: LinearProgressIndicator(
                value: 50.0,
                // backgroundColor: Color.fromARGB(255, 52, 73, 85),
                minHeight: 20,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                // color: Color.fromARGB(255, 52, 73, 85)
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ReorderableListView(
                onReorder: (oldIndex, newIndex) =>
                    update_myTiles_index(oldIndex, newIndex),
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                children: [
                  for (final tile in taskRepo)
                    if (tile[1] == 'Task')
                      TaskWidgets(
                        label: tile[0],
                        key: ValueKey(tile[0]),
                      )
                    else
                      SizedBox(
                        height: 30,
                        key: ValueKey(tile[0]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tile[0],
                            ),
                            const Divider(
                              color: Colors.grey,
                              height: 1,
                            )
                          ],
                        ),
                      ),
                ]),
            const Divider(
              height: 10,
              color: Colors.black,
              indent: 70,
              endIndent: 70,
            ),
            ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                children: [
                  const Text(
                    "Already done hey Tasks",
                    textAlign: TextAlign.start,
                  ),
                  for (final tile in finishedTasksRepo)
                    TaskWidgets(key: ValueKey(tile), label: tile)
                ]),
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            autofocus: true,
            controller: submitController,
            decoration: myTextFieldDecoration,
            textInputAction: TextInputAction.go,
            onSubmitted: addNewTask,
          ),
        ),
      ),
    );
  }
}

class TaskWidgets extends StatefulWidget {
  final String label;

  const TaskWidgets({super.key, required this.label});

  @override
  State<TaskWidgets> createState() => _TaskWidgetsState();
}

class _TaskWidgetsState extends State<TaskWidgets> {
  bool? _value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Checkbox(
          // activeColor: Colors.deepOrange,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          value: _value,
          onChanged: (bool? newValue) => setState(() {
            //Q where does new value come from
            _value = newValue;
          }),
        ),
        title: Text(widget.label),
        dense: true,
        // tileColor: Colors.deepOrangeAccent[100],
        textColor: Colors.black,
        contentPadding: const EdgeInsets.all(10),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
