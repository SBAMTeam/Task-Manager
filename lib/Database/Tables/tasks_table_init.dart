import 'package:moor/moor.dart';

class Tasks extends Table {
  IntColumn get taskId => integer().customConstraint(" PRIMARY KEY ")();
  TextColumn get taskName => text().withLength(min: 1, max: 50)();
  TextColumn get taskDetails => text()
      .nullable()
      .withLength(min: 1, max: 600)
      .customConstraint(" NULL ")();
  DateTimeColumn get taskStartDate =>
      dateTime().nullable().customConstraint(" NULL ")();
  DateTimeColumn get taskDeadline =>
      dateTime().nullable().customConstraint(" NULL ")();
  IntColumn get taskProgress =>
      integer().nullable().customConstraint(" NULL ")();
  IntColumn get taskCreatorId =>
      integer().nullable().customConstraint(" NULL ")();
  IntColumn get serverId =>
      integer().customConstraint(' REFERENCES servers(server_id) ')();
  IntColumn get userAssignedTask =>
      integer().nullable().customConstraint(" NULL ")();
  // Set<Column> get primrayKey => {taskId};

  // @override
  // List<String> get customConstraints => [
  //       'PRIMARY KEY (task_id)',
  //     ];
}
