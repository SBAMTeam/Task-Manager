import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class Users extends Table {
  IntColumn get userId => integer()();
  TextColumn get userName => text().nullable().withLength(min: 1, max: 50)();
  TextColumn get userEmail => text().withLength(min: 1, max: 50)();
  TextColumn get userLogMessage => text().withLength(min: 1, max: 200)();
  TextColumn get userNickname => text().withLength(min: 1, max: 50)();
  TextColumn get userJwt => text().withLength(min: 1, max: 300)();

  Set<Column> get primrayKey => {userId};
}

class Servers extends Table {
  IntColumn get serverId => integer()();
  TextColumn get serverName => text().withLength(min: 1, max: 50)();
  TextColumn get serverCode => text().withLength(min: 1, max: 50)();
  IntColumn get serverOwnerId => integer()();
  Set<Column> get primrayKey => {serverId};
}

class UserWithServers {
  final Users user;
  final Servers servers;

  UserWithServers({@required this.user, @required this.servers});
}

@UseMoor(tables: [Servers, Users], daos: [UserDao, ServerDao])
class Database extends _$Database {
  Database()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
  @override
  MigrationStrategy get migration => MigrationStrategy(
      // onUpgrade: (migrator, from, to) async {
      //       if (from == 1) {
      //         await migrator.addColumn(users, users._userName); //implement migrator when changing database after the app is published.
      //         await migrator.createTable(tags);
      //       }
      //     },
      // beforeOpen: (details) async {
      //   await customStatement('PRAGMA foreign_keys = ON');
      // },
      );
}

@UseDao(tables: [Users, Servers])
class UserDao extends DatabaseAccessor<Database> with _$UserDaoMixin {
  final Database db;

  UserDao(this.db) : super(db);

  Future insertUser(Insertable<User> user) => into(users).insert(user);
  Future updateUser(Insertable<User> user) => update(users).replace(user);
  Future deleteUser(Insertable<User> user) => delete(users).delete(user);
  Future getUserData() => select(users).get();
  Stream<List<UserWithServers>> watchUserData() {
    return (select(users)
          ..orderBy(
            [
              (t) =>
                  OrderingTerm(expression: t.userId, mode: OrderingMode.desc),
            ],
          ))
        .watch()
        .map((rows) => rows.map(
              (row) {
                return UserWithServers(servers: servers, user: users);
              },
            ).toList());
  }
}

@UseDao(tables: [Servers])
class ServerDao extends DatabaseAccessor<Database> with _$ServerDaoMixin {
  final Database db;

  ServerDao(this.db) : super(db);

  Stream<List<Server>> watchServers() => select(servers).watch();
  Future insertServer(Insertable<Server> server) =>
      into(servers).insert(server);

  Future getServers() => select(servers).get();
}
// Future insertUser(Insertable<User> user) => into(users).insert(user);
//   Future insertServer(Insertable<Server> server) =>
//       into(servers).insert(server);
