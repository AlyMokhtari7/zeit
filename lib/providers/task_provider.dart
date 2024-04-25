import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zeit/data/tasks_data.dart';

final taskProvider = Provider((ref) {
  return taskRepo;
});

final finishedTaskProvider = Provider((ref) {
  return finishedTasksRepo;
});
