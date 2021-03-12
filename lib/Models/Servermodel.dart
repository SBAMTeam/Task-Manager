class Servermodel {
  String serverName;
  String serverCode;
  String serverId;
  String serverOwnerId;

  Servermodel(
      {this.serverName, this.serverCode, this.serverId, this.serverOwnerId});

  Servermodel.fromJson(Map<String, dynamic> json) {
    serverName = json['serverName'];
    serverCode = json['serverCode'];
    serverId = json['serverId'];
    serverOwnerId = json['serverOwnerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serverName'] = this.serverName;
    data['serverCode'] = this.serverCode;
    data['serverId'] = this.serverId;
    data['serverOwnerId'] = this.serverOwnerId;
    return data;
  }
}
