class Usermodel {
  String username;
  String userhash;
  String email;
  String nickname;

  Usermodel({this.username, this.userhash, this.email, this.nickname});

  Usermodel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    userhash = json['userhash'];
    email = json['email'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['userhash'] = this.userhash;
    data['email'] = this.email;
    data['nickname'] = this.nickname;
    return data;
  }
}
