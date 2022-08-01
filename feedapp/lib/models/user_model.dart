class UserModel {
  int? id;
  String? userName;
  String? email;

  UserModel({this.id, this.userName, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userName = json["username"];
    email = json["email"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.userName;
    data['email'] = this.email;
    return data;
  }
}
