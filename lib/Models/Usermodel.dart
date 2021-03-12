class Usermodel {
  String username;
  String userhash;
  String userEmail;
  String userNickname;
  String userId;

  Usermodel(
      {this.username,
      this.userhash,
      this.userEmail,
      this.userId,
      this.userNickname});

  Usermodel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    userhash = json['userhash'];
    userEmail = json['userEmail'];
    userNickname = json['userNickname'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['userhash'] = this.userhash;
    data['userEmail'] = this.userEmail;
    data['userNickname'] = this.userNickname;
    data['userId'] = this.userId;
    return data;
  }
}
