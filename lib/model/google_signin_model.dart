class GoogleSignInModel {
  String? displayName;
  String? email;
  String? id;
  String? photoUrl;
  String? token;

  GoogleSignInModel(
      {this.displayName, this.email, this.id, this.photoUrl, this.token});

  GoogleSignInModel.fromJson(Map<String, dynamic> json) {
    displayName = json["displayName"];
    email = json["email"];
    id = json["id"];
    photoUrl = json["photoUrl"];
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data["displayName"] = displayName;
    data["email"] = email;
    data["id"] = id;
    data["photoUrl"] = photoUrl;
    data["token"] = token;
    return data;
  }
}