import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zeit/styled_text.dart';
import 'package:zeit/widgets/progress_bars.dart';
import 'package:zeit/widgets/task_entry_textfield.dart';
import 'package:zeit/widgets/task_list.dart';
import 'package:zeit/data/tasks_data.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TaskData(),
    child: MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final Set<String> _selected = {'hi'};

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true, primarySwatch: Colors.deepOrange),
        home: Scaffold(
          appBar: AppBar(),
          body: Column(
            
            children: [
              Row(
                children: [
                  Stack(children: [
                    Opacity(
                      opacity: 0.9,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Consumer<TaskData>(
                            builder: (context, taskData, child) {
                          return LinearProgressBar(
                              indicatorValue: taskData.getStatusCount("Done") /
                                  (taskData.getStatusCount("OnGoing") +
                                      taskData.getStatusCount("Done")));
                        }),
                      ),
                    ),
                  ]),
                ],
              ),
              Consumer<TaskData>(builder: (context, taskData, child) {
                return ConstrainedBox(
                  constraints:
                      const BoxConstraints(minHeight: 200, maxHeight: 800),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      TaskListView(
                        taskRepo: taskData.taskRepo,
                        title: "Saturday",
                        corespondingDate: DateTime.saturday,
                        viewType: "weekView",
                      ),
                      TaskListView(
                        taskRepo: taskData.taskRepo,
                        title: "Sunday",
                        corespondingDate: DateTime.sunday,
                        viewType: "weekView",
                      ),
                      TaskListView(
                        taskRepo: taskData.taskRepo,
                        title: "Monday",
                        corespondingDate: DateTime.monday,
                        viewType: "weekView",
                      ),
                      TaskListView(
                        taskRepo: taskData.taskRepo,
                        title: "Tuesday",
                        corespondingDate: DateTime.tuesday,
                        viewType: "weekView",
                      ),
                      TaskListView(
                        taskRepo: taskData.taskRepo,
                        title: "Wednesday",
                        corespondingDate: DateTime.wednesday,
                        viewType: "weekView",
                      ),
                      TaskListView(
                        taskRepo: taskData.taskRepo,
                        title: "Thursday",
                        corespondingDate: DateTime.thursday,
                        viewType: "weekView",
                      ),
                      TaskListView(
                        taskRepo: taskData.taskRepo,
                        title: "Friday",
                        corespondingDate: DateTime.friday,
                        viewType: "weekView",
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
          bottomNavigationBar: TaskEntry(),
        ),
      ),
    );
  }
}
