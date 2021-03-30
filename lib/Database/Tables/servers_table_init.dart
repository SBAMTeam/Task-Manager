import 'package:moor_flutter/moor_flutter.dart';

class Servers extends Table {
  IntColumn get serverId => integer().nullable()();
  TextColumn get serverName => text().nullable().withLength(min: 1, max: 50)();
  IntColumn get serverOwnerId => integer().nullable()();
  IntColumn get userId =>
      integer().nullable().customConstraint('NULL REFERENCES users(userId)')();
  Set<Column> get primrayKey => {serverId};
}
