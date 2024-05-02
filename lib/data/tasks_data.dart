import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskData extends ChangeNotifier {
  final submitController = TextEditingController();

  final taskRepo = {
    0: {
      "title": "Hi",
      "Type": "Task",
      "Status": "Done",
      "Proiority": 1,
      "Assignee": "Me",
      "DateTime": DateTime.sunday,
      "Labels": ["Uni", "Class", "DataBase"],
    },
    1: {
      "title": "Hola",
      "Type": "Task",
      "Status": "OnGoing",
      "Proiority": 1,
      "Assignee": "Me",
      "DateTime": DateTime.tuesday,
      "Labels": ["Work", "Internship"],
    },
    2: {
      "title": "Sect1",
      "Type": "Section",
      "Status": "None",
      "DateTime": "None",
      "Labels": "None"
    },
    3: {
      "title": "Hallo",
      "Type": "Task",
      "Status": "OnGoing",
      "Proiority": 1,
      "Assignee": "Me",
      "DateTime": DateTime.tuesday,
      "Labels": ["Astronomy"] as List,
    },
    4: {
      "title": "Sect2",
      "Type": "Section",
      "Status": "None",
      "DateTime": "None",
      "Labels": "None"
    },
  };

  void updateMyTilesIndex(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex--;
    }
    //get the tile we are moving
    //! bring back the following line
    // final tile = taskRepo.removeAt(oldIndex);
    //Place the tile in the new position
    //! bring back the following line
    // taskRepo.insert(newIndex, tile);
  }

  void addNewTask(String label /*, TextEditingController submitController*/) {
    taskRepo.addAll({
      (taskRepo.length + 1): {
        "title": label,
        "Type": "Task",
        "Status": "OnGoing",
        "Assignee": "Me",
        "DateTime": DateTime.tuesday,
        "Labels": ["Astronomy"] as List,
      }
    });
    notifyListeners();
    // submitController.text = "";
  }

  // void changeTaskSatatus() {}entry.value["Flag"]

  bool getStatusByTitle(String title) {
    for (final innerMap in taskRepo.values) {
      if (innerMap["title"] == title) {
        if (innerMap["Status"] == "Done") {
          return true;
        } else {
          return false;
        }
      }
    }
    return false;
  }

  int getStatusCount(String status) {
    int count = 0;
    for (final innerMap in taskRepo.values) {
      if (innerMap["Status"] == status) {
        count++;
      }
    }
    return count;
  }

  void changeStatus(String title) {
    for (final innerMap in taskRepo.values) {
      if (innerMap["title"] == title) {
        if (innerMap["Status"] == "Done") {
          innerMap["Status"] = "OnGoing";
        } else {
          innerMap["Status"] = "Done";
        }
      }
    }
    notifyListeners();
  }
}
