import 'package:moor_flutter/moor_flutter.dart';

class Tasks extends Table {
  IntColumn get taskId => integer()();
  TextColumn get taskName => text().nullable().withLength(min: 1, max: 50)();
  TextColumn get taskDetails =>
      text().nullable().withLength(min: 1, max: 600)();
  DateTimeColumn get taskStartDate => dateTime().nullable()();
  DateTimeColumn get taskDeadline => dateTime().nullable()();
  IntColumn get taskProgress => integer().nullable()();
  IntColumn get taskCreatorId => integer().nullable()();
  IntColumn get serverId => integer()
      .nullable()
      .customConstraint('NULL REFERENCES servers(server_Id)')();
  Set<Column> get primrayKey => {taskId};

  @override
  List<String> get customConstraints => [
        'PRIMARY KEY (task_Id)',
      ];
}
