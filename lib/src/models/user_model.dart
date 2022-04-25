class UserModel {
  String? uid;
  String? email;
  String? name;
  String? username;
  String? mobileNumber;

  UserModel({
    this.uid,
    this.email,
    this.name,
    this.username,
    this.mobileNumber,
  });

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      username: map['username'],
      mobileNumber: map['mobileNumber'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'username': username,
      'mobileNumber': mobileNumber,
    };
  }
}
