import 'package:moor/moor.dart';

class Servers extends Table {
  IntColumn get serverId => integer().customConstraint("PRIMARY KEY")();
  TextColumn get serverName => text().nullable().withLength(min: 1, max: 50)();
  IntColumn get serverOwnerId => integer().nullable()();
  IntColumn get userId =>
      integer().nullable().customConstraint('NULL REFERENCES users(user_id)')();
  // Set<Column> get primrayKey => {serverId};

  // List<String> get customConstraints => [
  //       'PRIMARY KEY (server_id)',
  //     ];
}
