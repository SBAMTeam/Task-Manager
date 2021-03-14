class Usermodel {
  String logMessages;
  String userId;
  String userNickname;
  String userEmail;
  String userhash;
  String username;
  String jwt;
  List<UserServers> userServers;

  Usermodel(
      {this.logMessages,
      this.userId,
      this.userNickname,
      this.userEmail,
      this.userhash,
      this.username,
      this.jwt,
      this.userServers});

  Usermodel.fromJson(Map<String, dynamic> json) {
    logMessages = json['LogMessages'];
    userId = json['userId'];
    userNickname = json['userNickname'];
    userEmail = json['userEmail'];
    userhash = json['userhash'];
    username = json['username'];
    jwt = json['jwt'];
    if (json['userServers'] != null) {
      userServers = new List<UserServers>();
      json['userServers'].forEach((v) {
        userServers.add(new UserServers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LogMessages'] = this.logMessages;
    data['userId'] = this.userId;
    data['userNickname'] = this.userNickname;
    data['userEmail'] = this.userEmail;
    data['userhash'] = this.userhash;
    data['username'] = this.username;
    data['jwt'] = this.jwt;
    if (this.userServers != null) {
      data['userServers'] = this.userServers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserServers {
  String s0;
  String s1;
  String serverId;
  String serverName;

  UserServers({this.s0, this.s1, this.serverId, this.serverName});

  UserServers.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
    serverId = json['Server_id'];
    serverName = json['Server_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.s0;
    data['1'] = this.s1;
    data['Server_id'] = this.serverId;
    data['Server_name'] = this.serverName;
    return data;
  }
}
