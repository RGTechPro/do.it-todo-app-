import 'package:flutter/foundation.dart';

import 'package:housy_task/model/task.dart';

class TaskData extends ChangeNotifier {
  List<Tasks> personal = [];
  List<Tasks> work = [];
  List<Tasks> home = [];
  String? profile;
}
