import 'package:moor/moor.dart';

class Users extends Table {
  IntColumn get userId => integer().customConstraint("PRIMARY KEY")();
  TextColumn get userName => text().nullable().withLength(min: 1, max: 50)();
  TextColumn get userEmail => text().withLength(min: 1, max: 50)();
  TextColumn get userLogMessage => text().withLength(min: 1, max: 200)();
  TextColumn get userNickname => text().withLength(min: 1, max: 50)();
  TextColumn get userJwt => text().withLength(min: 1, max: 300)();
  BoolColumn get userLoggedIn => boolean().withDefault(const Constant(false))();
  IntColumn get userLastServer => integer()
      .nullable()
      .customConstraint("NULL REFERENCES servers(server_id)")();
  // Set<Column> get primrayKey => {userId};

  // List<String> get customConstraints => [
  //       'PRIMARY KEY (user_id)',
  //     ];
}
