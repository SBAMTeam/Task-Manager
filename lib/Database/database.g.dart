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
  Server(
      {@required this.serverId,
      this.serverName,
      this.serverOwnerId,
      this.userId});
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
    @required int serverId,
    this.serverName = const Value.absent(),
    this.serverOwnerId = const Value.absent(),
    this.userId = const Value.absent(),
  }) : serverId = Value(serverId);
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
    return GeneratedIntColumn('server_id', $tableName, false,
        $customConstraints: 'PRIMARY KEY');
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
        $customConstraints: 'NULL REFERENCES users(user_id)');
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
    } else if (isInserting) {
      context.missing(_serverIdMeta);
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
  final bool userLoggedIn;
  final int userLastServer;
  User(
      {@required this.userId,
      this.userName,
      @required this.userEmail,
      @required this.userLogMessage,
      @required this.userNickname,
      @required this.userJwt,
      @required this.userLoggedIn,
      this.userLastServer});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
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
      userLoggedIn: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_logged_in']),
      userLastServer: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_last_server']),
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
    if (!nullToAbsent || userLoggedIn != null) {
      map['user_logged_in'] = Variable<bool>(userLoggedIn);
    }
    if (!nullToAbsent || userLastServer != null) {
      map['user_last_server'] = Variable<int>(userLastServer);
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
      userLoggedIn: userLoggedIn == null && nullToAbsent
          ? const Value.absent()
          : Value(userLoggedIn),
      userLastServer: userLastServer == null && nullToAbsent
          ? const Value.absent()
          : Value(userLastServer),
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
      userLoggedIn: serializer.fromJson<bool>(json['userLoggedIn']),
      userLastServer: serializer.fromJson<int>(json['userLastServer']),
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
      'userLoggedIn': serializer.toJson<bool>(userLoggedIn),
      'userLastServer': serializer.toJson<int>(userLastServer),
    };
  }

  User copyWith(
          {int userId,
          String userName,
          String userEmail,
          String userLogMessage,
          String userNickname,
          String userJwt,
          bool userLoggedIn,
          int userLastServer}) =>
      User(
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        userEmail: userEmail ?? this.userEmail,
        userLogMessage: userLogMessage ?? this.userLogMessage,
        userNickname: userNickname ?? this.userNickname,
        userJwt: userJwt ?? this.userJwt,
        userLoggedIn: userLoggedIn ?? this.userLoggedIn,
        userLastServer: userLastServer ?? this.userLastServer,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('userId: $userId, ')
          ..write('userName: $userName, ')
          ..write('userEmail: $userEmail, ')
          ..write('userLogMessage: $userLogMessage, ')
          ..write('userNickname: $userNickname, ')
          ..write('userJwt: $userJwt, ')
          ..write('userLoggedIn: $userLoggedIn, ')
          ..write('userLastServer: $userLastServer')
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
              $mrjc(
                  userLogMessage.hashCode,
                  $mrjc(
                      userNickname.hashCode,
                      $mrjc(
                          userJwt.hashCode,
                          $mrjc(userLoggedIn.hashCode,
                              userLastServer.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is User &&
          other.userId == this.userId &&
          other.userName == this.userName &&
          other.userEmail == this.userEmail &&
          other.userLogMessage == this.userLogMessage &&
          other.userNickname == this.userNickname &&
          other.userJwt == this.userJwt &&
          other.userLoggedIn == this.userLoggedIn &&
          other.userLastServer == this.userLastServer);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> userId;
  final Value<String> userName;
  final Value<String> userEmail;
  final Value<String> userLogMessage;
  final Value<String> userNickname;
  final Value<String> userJwt;
  final Value<bool> userLoggedIn;
  final Value<int> userLastServer;
  const UsersCompanion({
    this.userId = const Value.absent(),
    this.userName = const Value.absent(),
    this.userEmail = const Value.absent(),
    this.userLogMessage = const Value.absent(),
    this.userNickname = const Value.absent(),
    this.userJwt = const Value.absent(),
    this.userLoggedIn = const Value.absent(),
    this.userLastServer = const Value.absent(),
  });
  UsersCompanion.insert({
    @required int userId,
    this.userName = const Value.absent(),
    @required String userEmail,
    @required String userLogMessage,
    @required String userNickname,
    @required String userJwt,
    this.userLoggedIn = const Value.absent(),
    this.userLastServer = const Value.absent(),
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
    Expression<bool> userLoggedIn,
    Expression<int> userLastServer,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (userName != null) 'user_name': userName,
      if (userEmail != null) 'user_email': userEmail,
      if (userLogMessage != null) 'user_log_message': userLogMessage,
      if (userNickname != null) 'user_nickname': userNickname,
      if (userJwt != null) 'user_jwt': userJwt,
      if (userLoggedIn != null) 'user_logged_in': userLoggedIn,
      if (userLastServer != null) 'user_last_server': userLastServer,
    });
  }

  UsersCompanion copyWith(
      {Value<int> userId,
      Value<String> userName,
      Value<String> userEmail,
      Value<String> userLogMessage,
      Value<String> userNickname,
      Value<String> userJwt,
      Value<bool> userLoggedIn,
      Value<int> userLastServer}) {
    return UsersCompanion(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      userLogMessage: userLogMessage ?? this.userLogMessage,
      userNickname: userNickname ?? this.userNickname,
      userJwt: userJwt ?? this.userJwt,
      userLoggedIn: userLoggedIn ?? this.userLoggedIn,
      userLastServer: userLastServer ?? this.userLastServer,
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
    if (userLoggedIn.present) {
      map['user_logged_in'] = Variable<bool>(userLoggedIn.value);
    }
    if (userLastServer.present) {
      map['user_last_server'] = Variable<int>(userLastServer.value);
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
          ..write('userJwt: $userJwt, ')
          ..write('userLoggedIn: $userLoggedIn, ')
          ..write('userLastServer: $userLastServer')
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
    return GeneratedIntColumn('user_id', $tableName, false,
        $customConstraints: 'PRIMARY KEY');
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

  final VerificationMeta _userLoggedInMeta =
      const VerificationMeta('userLoggedIn');
  GeneratedBoolColumn _userLoggedIn;
  @override
  GeneratedBoolColumn get userLoggedIn =>
      _userLoggedIn ??= _constructUserLoggedIn();
  GeneratedBoolColumn _constructUserLoggedIn() {
    return GeneratedBoolColumn('user_logged_in', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _userLastServerMeta =
      const VerificationMeta('userLastServer');
  GeneratedIntColumn _userLastServer;
  @override
  GeneratedIntColumn get userLastServer =>
      _userLastServer ??= _constructUserLastServer();
  GeneratedIntColumn _constructUserLastServer() {
    return GeneratedIntColumn('user_last_server', $tableName, true,
        $customConstraints: 'NULL REFERENCES servers(server_id)');
  }

  @override
  List<GeneratedColumn> get $columns => [
        userId,
        userName,
        userEmail,
        userLogMessage,
        userNickname,
        userJwt,
        userLoggedIn,
        userLastServer
      ];
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
    if (data.containsKey('user_logged_in')) {
      context.handle(
          _userLoggedInMeta,
          userLoggedIn.isAcceptableOrUnknown(
              data['user_logged_in'], _userLoggedInMeta));
    }
    if (data.containsKey('user_last_server')) {
      context.handle(
          _userLastServerMeta,
          userLastServer.isAcceptableOrUnknown(
              data['user_last_server'], _userLastServerMeta));
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

class Task extends DataClass implements Insertable<Task> {
  final int taskId;
  final String taskName;
  final String taskDetails;
  final DateTime taskStartDate;
  final DateTime taskDeadline;
  final int userAssignedTask;
  final int taskCreatorId;
  final int serverId;
  Task(
      {@required this.taskId,
      @required this.taskName,
      this.taskDetails,
      this.taskStartDate,
      this.taskDeadline,
      this.userAssignedTask,
      this.taskCreatorId,
      @required this.serverId});
  factory Task.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Task(
      taskId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}task_id']),
      taskName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}task_name']),
      taskDetails: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}task_details']),
      taskStartDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}task_start_date']),
      taskDeadline: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}task_deadline']),
      userAssignedTask: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}user_assigned_task']),
      taskCreatorId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}task_creator_id']),
      serverId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}server_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || taskId != null) {
      map['task_id'] = Variable<int>(taskId);
    }
    if (!nullToAbsent || taskName != null) {
      map['task_name'] = Variable<String>(taskName);
    }
    if (!nullToAbsent || taskDetails != null) {
      map['task_details'] = Variable<String>(taskDetails);
    }
    if (!nullToAbsent || taskStartDate != null) {
      map['task_start_date'] = Variable<DateTime>(taskStartDate);
    }
    if (!nullToAbsent || taskDeadline != null) {
      map['task_deadline'] = Variable<DateTime>(taskDeadline);
    }
    if (!nullToAbsent || userAssignedTask != null) {
      map['user_assigned_task'] = Variable<int>(userAssignedTask);
    }
    if (!nullToAbsent || taskCreatorId != null) {
      map['task_creator_id'] = Variable<int>(taskCreatorId);
    }
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<int>(serverId);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      taskId:
          taskId == null && nullToAbsent ? const Value.absent() : Value(taskId),
      taskName: taskName == null && nullToAbsent
          ? const Value.absent()
          : Value(taskName),
      taskDetails: taskDetails == null && nullToAbsent
          ? const Value.absent()
          : Value(taskDetails),
      taskStartDate: taskStartDate == null && nullToAbsent
          ? const Value.absent()
          : Value(taskStartDate),
      taskDeadline: taskDeadline == null && nullToAbsent
          ? const Value.absent()
          : Value(taskDeadline),
      userAssignedTask: userAssignedTask == null && nullToAbsent
          ? const Value.absent()
          : Value(userAssignedTask),
      taskCreatorId: taskCreatorId == null && nullToAbsent
          ? const Value.absent()
          : Value(taskCreatorId),
      serverId: serverId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverId),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Task(
      taskId: serializer.fromJson<int>(json['taskId']),
      taskName: serializer.fromJson<String>(json['taskName']),
      taskDetails: serializer.fromJson<String>(json['taskDetails']),
      taskStartDate: serializer.fromJson<DateTime>(json['taskStartDate']),
      taskDeadline: serializer.fromJson<DateTime>(json['taskDeadline']),
      userAssignedTask: serializer.fromJson<int>(json['userAssignedTask']),
      taskCreatorId: serializer.fromJson<int>(json['taskCreatorId']),
      serverId: serializer.fromJson<int>(json['serverId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'taskId': serializer.toJson<int>(taskId),
      'taskName': serializer.toJson<String>(taskName),
      'taskDetails': serializer.toJson<String>(taskDetails),
      'taskStartDate': serializer.toJson<DateTime>(taskStartDate),
      'taskDeadline': serializer.toJson<DateTime>(taskDeadline),
      'userAssignedTask': serializer.toJson<int>(userAssignedTask),
      'taskCreatorId': serializer.toJson<int>(taskCreatorId),
      'serverId': serializer.toJson<int>(serverId),
    };
  }

  Task copyWith(
          {int taskId,
          String taskName,
          String taskDetails,
          DateTime taskStartDate,
          DateTime taskDeadline,
          int userAssignedTask,
          int taskCreatorId,
          int serverId}) =>
      Task(
        taskId: taskId ?? this.taskId,
        taskName: taskName ?? this.taskName,
        taskDetails: taskDetails ?? this.taskDetails,
        taskStartDate: taskStartDate ?? this.taskStartDate,
        taskDeadline: taskDeadline ?? this.taskDeadline,
        userAssignedTask: userAssignedTask ?? this.userAssignedTask,
        taskCreatorId: taskCreatorId ?? this.taskCreatorId,
        serverId: serverId ?? this.serverId,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('taskId: $taskId, ')
          ..write('taskName: $taskName, ')
          ..write('taskDetails: $taskDetails, ')
          ..write('taskStartDate: $taskStartDate, ')
          ..write('taskDeadline: $taskDeadline, ')
          ..write('userAssignedTask: $userAssignedTask, ')
          ..write('taskCreatorId: $taskCreatorId, ')
          ..write('serverId: $serverId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      taskId.hashCode,
      $mrjc(
          taskName.hashCode,
          $mrjc(
              taskDetails.hashCode,
              $mrjc(
                  taskStartDate.hashCode,
                  $mrjc(
                      taskDeadline.hashCode,
                      $mrjc(
                          userAssignedTask.hashCode,
                          $mrjc(
                              taskCreatorId.hashCode, serverId.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Task &&
          other.taskId == this.taskId &&
          other.taskName == this.taskName &&
          other.taskDetails == this.taskDetails &&
          other.taskStartDate == this.taskStartDate &&
          other.taskDeadline == this.taskDeadline &&
          other.userAssignedTask == this.userAssignedTask &&
          other.taskCreatorId == this.taskCreatorId &&
          other.serverId == this.serverId);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> taskId;
  final Value<String> taskName;
  final Value<String> taskDetails;
  final Value<DateTime> taskStartDate;
  final Value<DateTime> taskDeadline;
  final Value<int> userAssignedTask;
  final Value<int> taskCreatorId;
  final Value<int> serverId;
  const TasksCompanion({
    this.taskId = const Value.absent(),
    this.taskName = const Value.absent(),
    this.taskDetails = const Value.absent(),
    this.taskStartDate = const Value.absent(),
    this.taskDeadline = const Value.absent(),
    this.userAssignedTask = const Value.absent(),
    this.taskCreatorId = const Value.absent(),
    this.serverId = const Value.absent(),
  });
  TasksCompanion.insert({
    @required int taskId,
    @required String taskName,
    this.taskDetails = const Value.absent(),
    this.taskStartDate = const Value.absent(),
    this.taskDeadline = const Value.absent(),
    this.userAssignedTask = const Value.absent(),
    this.taskCreatorId = const Value.absent(),
    @required int serverId,
  })  : taskId = Value(taskId),
        taskName = Value(taskName),
        serverId = Value(serverId);
  static Insertable<Task> custom({
    Expression<int> taskId,
    Expression<String> taskName,
    Expression<String> taskDetails,
    Expression<DateTime> taskStartDate,
    Expression<DateTime> taskDeadline,
    Expression<int> userAssignedTask,
    Expression<int> taskCreatorId,
    Expression<int> serverId,
  }) {
    return RawValuesInsertable({
      if (taskId != null) 'task_id': taskId,
      if (taskName != null) 'task_name': taskName,
      if (taskDetails != null) 'task_details': taskDetails,
      if (taskStartDate != null) 'task_start_date': taskStartDate,
      if (taskDeadline != null) 'task_deadline': taskDeadline,
      if (userAssignedTask != null) 'user_assigned_task': userAssignedTask,
      if (taskCreatorId != null) 'task_creator_id': taskCreatorId,
      if (serverId != null) 'server_id': serverId,
    });
  }

  TasksCompanion copyWith(
      {Value<int> taskId,
      Value<String> taskName,
      Value<String> taskDetails,
      Value<DateTime> taskStartDate,
      Value<DateTime> taskDeadline,
      Value<int> userAssignedTask,
      Value<int> taskCreatorId,
      Value<int> serverId}) {
    return TasksCompanion(
      taskId: taskId ?? this.taskId,
      taskName: taskName ?? this.taskName,
      taskDetails: taskDetails ?? this.taskDetails,
      taskStartDate: taskStartDate ?? this.taskStartDate,
      taskDeadline: taskDeadline ?? this.taskDeadline,
      userAssignedTask: userAssignedTask ?? this.userAssignedTask,
      taskCreatorId: taskCreatorId ?? this.taskCreatorId,
      serverId: serverId ?? this.serverId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (taskId.present) {
      map['task_id'] = Variable<int>(taskId.value);
    }
    if (taskName.present) {
      map['task_name'] = Variable<String>(taskName.value);
    }
    if (taskDetails.present) {
      map['task_details'] = Variable<String>(taskDetails.value);
    }
    if (taskStartDate.present) {
      map['task_start_date'] = Variable<DateTime>(taskStartDate.value);
    }
    if (taskDeadline.present) {
      map['task_deadline'] = Variable<DateTime>(taskDeadline.value);
    }
    if (userAssignedTask.present) {
      map['user_assigned_task'] = Variable<int>(userAssignedTask.value);
    }
    if (taskCreatorId.present) {
      map['task_creator_id'] = Variable<int>(taskCreatorId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<int>(serverId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('taskId: $taskId, ')
          ..write('taskName: $taskName, ')
          ..write('taskDetails: $taskDetails, ')
          ..write('taskStartDate: $taskStartDate, ')
          ..write('taskDeadline: $taskDeadline, ')
          ..write('userAssignedTask: $userAssignedTask, ')
          ..write('taskCreatorId: $taskCreatorId, ')
          ..write('serverId: $serverId')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  final GeneratedDatabase _db;
  final String _alias;
  $TasksTable(this._db, [this._alias]);
  final VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  GeneratedIntColumn _taskId;
  @override
  GeneratedIntColumn get taskId => _taskId ??= _constructTaskId();
  GeneratedIntColumn _constructTaskId() {
    return GeneratedIntColumn('task_id', $tableName, false,
        $customConstraints: ' PRIMARY KEY ');
  }

  final VerificationMeta _taskNameMeta = const VerificationMeta('taskName');
  GeneratedTextColumn _taskName;
  @override
  GeneratedTextColumn get taskName => _taskName ??= _constructTaskName();
  GeneratedTextColumn _constructTaskName() {
    return GeneratedTextColumn('task_name', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _taskDetailsMeta =
      const VerificationMeta('taskDetails');
  GeneratedTextColumn _taskDetails;
  @override
  GeneratedTextColumn get taskDetails =>
      _taskDetails ??= _constructTaskDetails();
  GeneratedTextColumn _constructTaskDetails() {
    return GeneratedTextColumn('task_details', $tableName, true,
        minTextLength: 1, maxTextLength: 600, $customConstraints: ' NULL ');
  }

  final VerificationMeta _taskStartDateMeta =
      const VerificationMeta('taskStartDate');
  GeneratedDateTimeColumn _taskStartDate;
  @override
  GeneratedDateTimeColumn get taskStartDate =>
      _taskStartDate ??= _constructTaskStartDate();
  GeneratedDateTimeColumn _constructTaskStartDate() {
    return GeneratedDateTimeColumn('task_start_date', $tableName, true,
        $customConstraints: ' NULL ');
  }

  final VerificationMeta _taskDeadlineMeta =
      const VerificationMeta('taskDeadline');
  GeneratedDateTimeColumn _taskDeadline;
  @override
  GeneratedDateTimeColumn get taskDeadline =>
      _taskDeadline ??= _constructTaskDeadline();
  GeneratedDateTimeColumn _constructTaskDeadline() {
    return GeneratedDateTimeColumn('task_deadline', $tableName, true,
        $customConstraints: ' NULL ');
  }

  final VerificationMeta _userAssignedTaskMeta =
      const VerificationMeta('userAssignedTask');
  GeneratedIntColumn _userAssignedTask;
  @override
  GeneratedIntColumn get userAssignedTask =>
      _userAssignedTask ??= _constructUserAssignedTask();
  GeneratedIntColumn _constructUserAssignedTask() {
    return GeneratedIntColumn('user_assigned_task', $tableName, true,
        $customConstraints: ' NULL ');
  }

  final VerificationMeta _taskCreatorIdMeta =
      const VerificationMeta('taskCreatorId');
  GeneratedIntColumn _taskCreatorId;
  @override
  GeneratedIntColumn get taskCreatorId =>
      _taskCreatorId ??= _constructTaskCreatorId();
  GeneratedIntColumn _constructTaskCreatorId() {
    return GeneratedIntColumn('task_creator_id', $tableName, true,
        $customConstraints: ' NULL ');
  }

  final VerificationMeta _serverIdMeta = const VerificationMeta('serverId');
  GeneratedIntColumn _serverId;
  @override
  GeneratedIntColumn get serverId => _serverId ??= _constructServerId();
  GeneratedIntColumn _constructServerId() {
    return GeneratedIntColumn('server_id', $tableName, false,
        $customConstraints: ' REFERENCES servers(server_id) ');
  }

  @override
  List<GeneratedColumn> get $columns => [
        taskId,
        taskName,
        taskDetails,
        taskStartDate,
        taskDeadline,
        userAssignedTask,
        taskCreatorId,
        serverId
      ];
  @override
  $TasksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tasks';
  @override
  final String actualTableName = 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id'], _taskIdMeta));
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('task_name')) {
      context.handle(_taskNameMeta,
          taskName.isAcceptableOrUnknown(data['task_name'], _taskNameMeta));
    } else if (isInserting) {
      context.missing(_taskNameMeta);
    }
    if (data.containsKey('task_details')) {
      context.handle(
          _taskDetailsMeta,
          taskDetails.isAcceptableOrUnknown(
              data['task_details'], _taskDetailsMeta));
    }
    if (data.containsKey('task_start_date')) {
      context.handle(
          _taskStartDateMeta,
          taskStartDate.isAcceptableOrUnknown(
              data['task_start_date'], _taskStartDateMeta));
    }
    if (data.containsKey('task_deadline')) {
      context.handle(
          _taskDeadlineMeta,
          taskDeadline.isAcceptableOrUnknown(
              data['task_deadline'], _taskDeadlineMeta));
    }
    if (data.containsKey('user_assigned_task')) {
      context.handle(
          _userAssignedTaskMeta,
          userAssignedTask.isAcceptableOrUnknown(
              data['user_assigned_task'], _userAssignedTaskMeta));
    }
    if (data.containsKey('task_creator_id')) {
      context.handle(
          _taskCreatorIdMeta,
          taskCreatorId.isAcceptableOrUnknown(
              data['task_creator_id'], _taskCreatorIdMeta));
    }
    if (data.containsKey('server_id')) {
      context.handle(_serverIdMeta,
          serverId.isAcceptableOrUnknown(data['server_id'], _serverIdMeta));
    } else if (isInserting) {
      context.missing(_serverIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Task map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Task.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ServersTable _servers;
  $ServersTable get servers => _servers ??= $ServersTable(this);
  $UsersTable _users;
  $UsersTable get users => _users ??= $UsersTable(this);
  $TasksTable _tasks;
  $TasksTable get tasks => _tasks ??= $TasksTable(this);
  UserDao _userDao;
  UserDao get userDao => _userDao ??= UserDao(this as Database);
  ServerDao _serverDao;
  ServerDao get serverDao => _serverDao ??= ServerDao(this as Database);
  TaskDao _taskDao;
  TaskDao get taskDao => _taskDao ??= TaskDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [servers, users, tasks];
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
mixin _$TaskDaoMixin on DatabaseAccessor<Database> {
  $TasksTable get tasks => attachedDatabase.tasks;
}
