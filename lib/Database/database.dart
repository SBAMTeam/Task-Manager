import 'package:moor/ffi.dart';

import 'Tables/tasks_table_init.dart';
import 'Tables/users_table_init.dart';
import 'Tables/servers_table_init.dart';
import 'package:sqflite/sqflite.dart' show getDatabasesPath;
import 'package:path/path.dart' as p;
import 'dart:ffi';
import 'dart:io';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3/open.dart';
import 'package:moor/moor.dart';
part 'database.g.dart';

class UserWithServers {
  final Users user;
  final Servers servers;

  UserWithServers({@required this.user, @required this.servers});
}

@UseMoor(tables: [Servers, Users, Tasks], daos: [UserDao, ServerDao, TaskDao])
class Database extends _$Database {
  Database()
      : super(
          LazyDatabase(
            () async {
              final dbFolder = await getDatabasesPath();
              final file = File(p.join(dbFolder, 'db.sqlite'));
              return VmDatabase(file, logStatements: true);
            },
          ),
        );
  // super(FlutterQueryExecutor.inDatabaseFolder(
  //       path: 'db.sqlite', logStatements: true));

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

@UseDao(tables: [Tasks])
class TaskDao extends DatabaseAccessor<Database> with _$TaskDaoMixin {
  final Database db;

  TaskDao(this.db) : super(db);

  Stream<List<Task>> watchTasks() => select(tasks).watch();
  Future insertTask(Insertable<Task> task) {
    try {
      return into(tasks).insert(task,
          onConflict: DoUpdate((_) => task, target: [db.tasks.taskId]));
    } catch (e) {
      print("error in insertTask in database.dart : $e");
      return null;
    }
  }

  Future getTasks() => select(tasks).get();
  Future getTasksWithServerId(int id) =>
      (select(tasks)..where((a) => a.serverId.equals(id))).get();
}
