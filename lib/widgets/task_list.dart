//todo make the default list stateful too

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zeit/data/tasks_data.dart';
import 'package:zeit/styled_text.dart';
import 'package:zeit/widgets/section_indicator.dart';
import 'package:zeit/widgets/task_item.dart';
import 'package:provider/provider.dart';

class TaskListView extends StatelessWidget {
  final Map<int, Map<String, Object>> taskRepo;
  final String title;
  final int corespondingDate;
  final String viewType;

  const TaskListView({
    super.key,
    required this.taskRepo,
    required this.title,
    required this.corespondingDate,
    required this.viewType,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
          minWidth: 300, maxWidth: 450, minHeight: 200, maxHeight: 900),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border:
                Border.all(color: Color.fromARGB(108, 71, 85, 105), width: 1)),
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            StyledText(title),
            Expanded(
              child: ListView.builder(
                clipBehavior: Clip.hardEdge,
                itemCount: taskRepo.values.length,
                itemBuilder: (context, index) {
                  final innerMap = taskRepo.values
                      .toList()[index]; // its not efficient , I dont care ;)
                  if (innerMap["Type"] == 'Task' &&
                      innerMap["DateTime"] == corespondingDate) {
                    return TaskItem(
                      label: innerMap["title"] as String,
                      key: ValueKey(index),
                      flairs: innerMap["Labels"] as List<dynamic>,
                    );
                  } else if (innerMap["Type"] == 'Section' &&
                      viewType == "List") {
                    return SectionIndicator(text: innerMap["title"] as String);
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
            // Column(
            //   // shrinkWrap: true,
            //   // padding: const EdgeInsets.all(10),
            //   children: [
            //     for (final innerMap in taskRepo.values)
            //       if (innerMap["Type"] == 'Task' &&
            //           innerMap["DateTime"] == corespondingDate)
            //         TaskItem(
            //           label: innerMap["title"] as String,
            //           key: ValueKey(innerMap["title"]),
            //           flairs: innerMap["Labels"] as List<dynamic>,
            //         )
            //       else if (innerMap["Type"] == 'Section' && viewType == "List")
            //         SectionIndicator(text: innerMap["title"] as String)
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

// class ReorderableTaskListView extends StatefulWidget {
//   final List taskRepo;
//   // final TextEditingController submitControllerOBJ;

//   const ReorderableTaskListView({
//     super.key,
//     required this.taskRepo,
//     // this.submitControllerOBJ,
//   });

//   @override
//   State<ReorderableTaskListView> createState() =>
//       _ReorderableTaskListViewState();
// }

// class _ReorderableTaskListViewState extends State<ReorderableTaskListView> {
//   // Reorder method

//   @override
//   Widget build(BuildContext context) {
//     return ReorderableListView(
//         onReorder: (oldIndex, newIndex) =>
//             Provider.of<TaskData>(context, listen: false)
//                 .updateMyTilesIndex(oldIndex, newIndex),
//         shrinkWrap: true,
//         padding: const EdgeInsets.all(10),
//         children: [
//           for (final tile in widget.taskRepo)
//             if (tile[1] == 'Task')
//               TaskItem(
//                 label: tile[0],
//                 key: ValueKey(tile[0]),
//               )
//             else
//               SectionIndicator(
//                 text: tile[0],
//                 key: ValueKey(tile[0]),
//               ),
//         ]);
//   }
// }
