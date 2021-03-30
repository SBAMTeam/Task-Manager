import 'package:moor_flutter/moor_flutter.dart';

class Tasks extends Table {
  IntColumn get taskId => integer().nullable()();
  TextColumn get taskName => text().nullable().withLength(min: 1, max: 50)();
  TextColumn get taskDetails =>
      text().nullable().withLength(min: 1, max: 600)();
  DateTimeColumn get taskStartDate => dateTime().nullable()();
  DateTimeColumn get taskDeadline => dateTime().nullable()();
  IntColumn get taskProgress => integer().nullable()();
  IntColumn get taskCreatorId => integer().nullable()();
  IntColumn get serverId => integer()
      .nullable()
      .customConstraint('NULL REFERENCES servers(serverId)')();
  Set<Column> get primrayKey => {taskId};
}
