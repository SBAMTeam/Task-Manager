// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Server extends DataClass implements Insertable<Server> {
  final int serverId;
  final String serverName;
  final int serverOwnerId;
  final int userId;
  Server({this.serverId, this.serverName, this.serverOwnerId, this.userId});
  factory Server.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Server(
      serverId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}server_id']),
      serverName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}server_name']),
      serverOwnerId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}server_owner_id']),
      userId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<int>(serverId);
    }
    if (!nullToAbsent || serverName != null) {
      map['server_name'] = Variable<String>(serverName);
    }
    if (!nullToAbsent || serverOwnerId != null) {
      map['server_owner_id'] = Variable<int>(serverOwnerId);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    return map;
  }

  ServersCompanion toCompanion(bool nullToAbsent) {
    return ServersCompanion(
      serverId: serverId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverId),
      serverName: serverName == null && nullToAbsent
          ? const Value.absent()
          : Value(serverName),
      serverOwnerId: serverOwnerId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverOwnerId),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
    );
  }

  factory Server.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Server(
      serverId: serializer.fromJson<int>(json['serverId']),
      serverName: serializer.fromJson<String>(json['serverName']),
      serverOwnerId: serializer.fromJson<int>(json['serverOwnerId']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serverId': serializer.toJson<int>(serverId),
      'serverName': serializer.toJson<String>(serverName),
      'serverOwnerId': serializer.toJson<int>(serverOwnerId),
      'userId': serializer.toJson<int>(userId),
    };
  }

  Server copyWith(
          {int serverId, String serverName, int serverOwnerId, int userId}) =>
      Server(
        serverId: serverId ?? this.serverId,
        serverName: serverName ?? this.serverName,
        serverOwnerId: serverOwnerId ?? this.serverOwnerId,
        userId: userId ?? this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('Server(')
          ..write('serverId: $serverId, ')
          ..write('serverName: $serverName, ')
          ..write('serverOwnerId: $serverOwnerId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      serverId.hashCode,
      $mrjc(serverName.hashCode,
          $mrjc(serverOwnerId.hashCode, userId.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Server &&
          other.serverId == this.serverId &&
          other.serverName == this.serverName &&
          other.serverOwnerId == this.serverOwnerId &&
          other.userId == this.userId);
}

class ServersCompanion extends UpdateCompanion<Server> {
  final Value<int> serverId;
  final Value<String> serverName;
  final Value<int> serverOwnerId;
  final Value<int> userId;
  const ServersCompanion({
    this.serverId = const Value.absent(),
    this.serverName = const Value.absent(),
    this.serverOwnerId = const Value.absent(),
    this.userId = const Value.absent(),
  });
  ServersCompanion.insert({
    this.serverId = const Value.absent(),
    this.serverName = const Value.absent(),
    this.serverOwnerId = const Value.absent(),
    this.userId = const Value.absent(),
  });
  static Insertable<Server> custom({
    Expression<int> serverId,
    Expression<String> serverName,
    Expression<int> serverOwnerId,
    Expression<int> userId,
  }) {
    return RawValuesInsertable({
      if (serverId != null) 'server_id': serverId,
      if (serverName != null) 'server_name': serverName,
      if (serverOwnerId != null) 'server_owner_id': serverOwnerId,
      if (userId != null) 'user_id': userId,
    });
  }

  ServersCompanion copyWith(
      {Value<int> serverId,
      Value<String> serverName,
      Value<int> serverOwnerId,
      Value<int> userId}) {
    return ServersCompanion(
      serverId: serverId ?? this.serverId,
      serverName: serverName ?? this.serverName,
      serverOwnerId: serverOwnerId ?? this.serverOwnerId,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serverId.present) {
      map['server_id'] = Variable<int>(serverId.value);
    }
    if (serverName.present) {
      map['server_name'] = Variable<String>(serverName.value);
    }
    if (serverOwnerId.present) {
      map['server_owner_id'] = Variable<int>(serverOwnerId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServersCompanion(')
          ..write('serverId: $serverId, ')
          ..write('serverName: $serverName, ')
          ..write('serverOwnerId: $serverOwnerId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class $ServersTable extends Servers with TableInfo<$ServersTable, Server> {
  final GeneratedDatabase _db;
  final String _alias;
  $ServersTable(this._db, [this._alias]);
  final VerificationMeta _serverIdMeta = const VerificationMeta('serverId');
  GeneratedIntColumn _serverId;
  @override
  GeneratedIntColumn get serverId => _serverId ??= _constructServerId();
  GeneratedIntColumn _constructServerId() {
    return GeneratedIntColumn(
      'server_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _serverNameMeta = const VerificationMeta('serverName');
  GeneratedTextColumn _serverName;
  @override
  GeneratedTextColumn get serverName => _serverName ??= _constructServerName();
  GeneratedTextColumn _constructServerName() {
    return GeneratedTextColumn('server_name', $tableName, true,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _serverOwnerIdMeta =
      const VerificationMeta('serverOwnerId');
  GeneratedIntColumn _serverOwnerId;
  @override
  GeneratedIntColumn get serverOwnerId =>
      _serverOwnerId ??= _constructServerOwnerId();
  GeneratedIntColumn _constructServerOwnerId() {
    return GeneratedIntColumn(
      'server_owner_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedIntColumn _userId;
  @override
  GeneratedIntColumn get userId => _userId ??= _constructUserId();
  GeneratedIntColumn _constructUserId() {
    return GeneratedIntColumn('user_id', $tableName, true,
        $customConstraints: 'NULL REFERENCES users(userId)');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [serverId, serverName, serverOwnerId, userId];
  @override
  $ServersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'servers';
  @override
  final String actualTableName = 'servers';
  @override
  VerificationContext validateIntegrity(Insertable<Server> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('server_id')) {
      context.handle(_serverIdMeta,
          serverId.isAcceptableOrUnknown(data['server_id'], _serverIdMeta));
    }
    if (data.containsKey('server_name')) {
      context.handle(
          _serverNameMeta,
          serverName.isAcceptableOrUnknown(
              data['server_name'], _serverNameMeta));
    }
    if (data.containsKey('server_owner_id')) {
      context.handle(
          _serverOwnerIdMeta,
          serverOwnerId.isAcceptableOrUnknown(
              data['server_owner_id'], _serverOwnerIdMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Server map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Server.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ServersTable createAlias(String alias) {
    return $ServersTable(_db, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int userId;
  final String userName;
  final String userEmail;
  final String userLogMessage;
  final String userNickname;
  final String userJwt;
  User(
      {@required this.userId,
      this.userName,
      @required this.userEmail,
      @required this.userLogMessage,
      @required this.userNickname,
      @required this.userJwt});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return User(
      userId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      userName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_name']),
      userEmail: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_email']),
      userLogMessage: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_log_message']),
      userNickname: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_nickname']),
      userJwt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_jwt']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    if (!nullToAbsent || userName != null) {
      map['user_name'] = Variable<String>(userName);
    }
    if (!nullToAbsent || userEmail != null) {
      map['user_email'] = Variable<String>(userEmail);
    }
    if (!nullToAbsent || userLogMessage != null) {
      map['user_log_message'] = Variable<String>(userLogMessage);
    }
    if (!nullToAbsent || userNickname != null) {
      map['user_nickname'] = Variable<String>(userNickname);
    }
    if (!nullToAbsent || userJwt != null) {
      map['user_jwt'] = Variable<String>(userJwt);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      userName: userName == null && nullToAbsent
          ? const Value.absent()
          : Value(userName),
      userEmail: userEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(userEmail),
      userLogMessage: userLogMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(userLogMessage),
      userNickname: userNickname == null && nullToAbsent
          ? const Value.absent()
          : Value(userNickname),
      userJwt: userJwt == null && nullToAbsent
          ? const Value.absent()
          : Value(userJwt),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      userId: serializer.fromJson<int>(json['userId']),
      userName: serializer.fromJson<String>(json['userName']),
      userEmail: serializer.fromJson<String>(json['userEmail']),
      userLogMessage: serializer.fromJson<String>(json['userLogMessage']),
      userNickname: serializer.fromJson<String>(json['userNickname']),
      userJwt: serializer.fromJson<String>(json['userJwt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'userName': serializer.toJson<String>(userName),
      'userEmail': serializer.toJson<String>(userEmail),
      'userLogMessage': serializer.toJson<String>(userLogMessage),
      'userNickname': serializer.toJson<String>(userNickname),
      'userJwt': serializer.toJson<String>(userJwt),
    };
  }

  User copyWith(
          {int userId,
          String userName,
          String userEmail,
          String userLogMessage,
          String userNickname,
          String userJwt}) =>
      User(
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        userEmail: userEmail ?? this.userEmail,
        userLogMessage: userLogMessage ?? this.userLogMessage,
        userNickname: userNickname ?? this.userNickname,
        userJwt: userJwt ?? this.userJwt,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('userId: $userId, ')
          ..write('userName: $userName, ')
          ..write('userEmail: $userEmail, ')
          ..write('userLogMessage: $userLogMessage, ')
          ..write('userNickname: $userNickname, ')
          ..write('userJwt: $userJwt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      userId.hashCode,
      $mrjc(
          userName.hashCode,
          $mrjc(
              userEmail.hashCode,
              $mrjc(userLogMessage.hashCode,
                  $mrjc(userNickname.hashCode, userJwt.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is User &&
          other.userId == this.userId &&
          other.userName == this.userName &&
          other.userEmail == this.userEmail &&
          other.userLogMessage == this.userLogMessage &&
          other.userNickname == this.userNickname &&
          other.userJwt == this.userJwt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> userId;
  final Value<String> userName;
  final Value<String> userEmail;
  final Value<String> userLogMessage;
  final Value<String> userNickname;
  final Value<String> userJwt;
  const UsersCompanion({
    this.userId = const Value.absent(),
    this.userName = const Value.absent(),
    this.userEmail = const Value.absent(),
    this.userLogMessage = const Value.absent(),
    this.userNickname = const Value.absent(),
    this.userJwt = const Value.absent(),
  });
  UsersCompanion.insert({
    @required int userId,
    this.userName = const Value.absent(),
    @required String userEmail,
    @required String userLogMessage,
    @required String userNickname,
    @required String userJwt,
  })  : userId = Value(userId),
        userEmail = Value(userEmail),
        userLogMessage = Value(userLogMessage),
        userNickname = Value(userNickname),
        userJwt = Value(userJwt);
  static Insertable<User> custom({
    Expression<int> userId,
    Expression<String> userName,
    Expression<String> userEmail,
    Expression<String> userLogMessage,
    Expression<String> userNickname,
    Expression<String> userJwt,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (userName != null) 'user_name': userName,
      if (userEmail != null) 'user_email': userEmail,
      if (userLogMessage != null) 'user_log_message': userLogMessage,
      if (userNickname != null) 'user_nickname': userNickname,
      if (userJwt != null) 'user_jwt': userJwt,
    });
  }

  UsersCompanion copyWith(
      {Value<int> userId,
      Value<String> userName,
      Value<String> userEmail,
      Value<String> userLogMessage,
      Value<String> userNickname,
      Value<String> userJwt}) {
    return UsersCompanion(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      userLogMessage: userLogMessage ?? this.userLogMessage,
      userNickname: userNickname ?? this.userNickname,
      userJwt: userJwt ?? this.userJwt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (userEmail.present) {
      map['user_email'] = Variable<String>(userEmail.value);
    }
    if (userLogMessage.present) {
      map['user_log_message'] = Variable<String>(userLogMessage.value);
    }
    if (userNickname.present) {
      map['user_nickname'] = Variable<String>(userNickname.value);
    }
    if (userJwt.present) {
      map['user_jwt'] = Variable<String>(userJwt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('userId: $userId, ')
          ..write('userName: $userName, ')
          ..write('userEmail: $userEmail, ')
          ..write('userLogMessage: $userLogMessage, ')
          ..write('userNickname: $userNickname, ')
          ..write('userJwt: $userJwt')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedIntColumn _userId;
  @override
  GeneratedIntColumn get userId => _userId ??= _constructUserId();
  GeneratedIntColumn _constructUserId() {
    return GeneratedIntColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userNameMeta = const VerificationMeta('userName');
  GeneratedTextColumn _userName;
  @override
  GeneratedTextColumn get userName => _userName ??= _constructUserName();
  GeneratedTextColumn _constructUserName() {
    return GeneratedTextColumn('user_name', $tableName, true,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _userEmailMeta = const VerificationMeta('userEmail');
  GeneratedTextColumn _userEmail;
  @override
  GeneratedTextColumn get userEmail => _userEmail ??= _constructUserEmail();
  GeneratedTextColumn _constructUserEmail() {
    return GeneratedTextColumn('user_email', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _userLogMessageMeta =
      const VerificationMeta('userLogMessage');
  GeneratedTextColumn _userLogMessage;
  @override
  GeneratedTextColumn get userLogMessage =>
      _userLogMessage ??= _constructUserLogMessage();
  GeneratedTextColumn _constructUserLogMessage() {
    return GeneratedTextColumn('user_log_message', $tableName, false,
        minTextLength: 1, maxTextLength: 200);
  }

  final VerificationMeta _userNicknameMeta =
      const VerificationMeta('userNickname');
  GeneratedTextColumn _userNickname;
  @override
  GeneratedTextColumn get userNickname =>
      _userNickname ??= _constructUserNickname();
  GeneratedTextColumn _constructUserNickname() {
    return GeneratedTextColumn('user_nickname', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _userJwtMeta = const VerificationMeta('userJwt');
  GeneratedTextColumn _userJwt;
  @override
  GeneratedTextColumn get userJwt => _userJwt ??= _constructUserJwt();
  GeneratedTextColumn _constructUserJwt() {
    return GeneratedTextColumn('user_jwt', $tableName, false,
        minTextLength: 1, maxTextLength: 300);
  }

  @override
  List<GeneratedColumn> get $columns =>
      [userId, userName, userEmail, userLogMessage, userNickname, userJwt];
  @override
  $UsersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'users';
  @override
  final String actualTableName = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name'], _userNameMeta));
    }
    if (data.containsKey('user_email')) {
      context.handle(_userEmailMeta,
          userEmail.isAcceptableOrUnknown(data['user_email'], _userEmailMeta));
    } else if (isInserting) {
      context.missing(_userEmailMeta);
    }
    if (data.containsKey('user_log_message')) {
      context.handle(
          _userLogMessageMeta,
          userLogMessage.isAcceptableOrUnknown(
              data['user_log_message'], _userLogMessageMeta));
    } else if (isInserting) {
      context.missing(_userLogMessageMeta);
    }
    if (data.containsKey('user_nickname')) {
      context.handle(
          _userNicknameMeta,
          userNickname.isAcceptableOrUnknown(
              data['user_nickname'], _userNicknameMeta));
    } else if (isInserting) {
      context.missing(_userNicknameMeta);
    }
    if (data.containsKey('user_jwt')) {
      context.handle(_userJwtMeta,
          userJwt.isAcceptableOrUnknown(data['user_jwt'], _userJwtMeta));
    } else if (isInserting) {
      context.missing(_userJwtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  User map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return User.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ServersTable _servers;
  $ServersTable get servers => _servers ??= $ServersTable(this);
  $UsersTable _users;
  $UsersTable get users => _users ??= $UsersTable(this);
  UserDao _userDao;
  UserDao get userDao => _userDao ??= UserDao(this as Database);
  ServerDao _serverDao;
  ServerDao get serverDao => _serverDao ??= ServerDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [servers, users];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$UserDaoMixin on DatabaseAccessor<Database> {
  $UsersTable get users => attachedDatabase.users;
  $ServersTable get servers => attachedDatabase.servers;
}
mixin _$ServerDaoMixin on DatabaseAccessor<Database> {
  $ServersTable get servers => attachedDatabase.servers;
}
