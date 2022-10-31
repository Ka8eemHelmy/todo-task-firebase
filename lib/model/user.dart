class User{
  String? email;
  String? username;
  String? phone;
  String? uId;
  bool? emailVerified;

  User({this.email, this.username, this.phone, this.emailVerified, this.uId});

  User.fromJson(Map<String, dynamic> json){
    email = json['email'];
    username = json['username'];
    phone = json['phone'];
    emailVerified = json['emailVerified'];
    uId = json['uId'];
  }

  Map<String, dynamic> toJson(){
    return {
      'email': email,
      'username' : username,
      'phone' : phone,
      'emailVerified' : emailVerified,
      'uId' : uId,
    };
  }
}