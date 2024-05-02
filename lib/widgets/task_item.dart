import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:zeit/data/tasks_data.dart';
import 'package:zeit/widgets/chip.dart';

class TaskItem extends StatefulWidget {
  final String label;
  final List<dynamic> flairs;

  const TaskItem({super.key, required this.label, required this.flairs});

  @override
  State<TaskItem> createState() => _TaskItemsState();
}

class _TaskItemsState extends State<TaskItem> {
  // bool? _value = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return Container(
        margin: const EdgeInsets.all(10),
        child: ListTile(
          leading: Checkbox(
            // activeColor: Colors.deepOrange,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            value: taskData.getStatusByTitle(widget.label),
            onChanged: (bool? newValue) =>
                {taskData.changeStatus(widget.label)},
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
              Wrap(
                children: [
                  const LabelChip(
                    label: "Proiority:",
                    leadingIcon: Icon(
                      Icons.emergency_outlined,
                      size: 20,
                    ),
                  ),
                  const LabelChip(
                    label: "Assigne",
                    leadingIcon: Icon(
                      Icons.alternate_email_outlined,
                      size: 20,
                    ),
                  ),
                  for (final flair in widget.flairs)
                    LabelChip(
                      label: flair,
                      leadingIcon: const Icon(
                        Icons.flag,
                        size: 20,
                      ),
                    )
                ],
              )
            ],
          ),
          dense: true,
          tileColor: const Color.fromARGB(255, 232, 234, 235),
          textColor: Colors.black,
          // contentPadding: const EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      );
    });
  }
}
