class Servermodel {
  String serverName;
  String loginCode;
  String serverId;
  String ownerId;

  Servermodel({this.serverName, this.loginCode, this.serverId, this.ownerId});

  Servermodel.fromJson(Map<String, dynamic> json) {
    serverName = json['serverName'];
    loginCode = json['loginCode'];
    serverId = json['serverId'];
    ownerId = json['ownerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serverName'] = this.serverName;
    data['loginCode'] = this.loginCode;
    data['serverId'] = this.serverId;
    data['ownerId'] = this.ownerId;
    return data;
  }
}
