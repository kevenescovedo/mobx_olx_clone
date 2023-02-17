
enum UserType {PARTICULAR, PROFISSIONAL}
class User {
  String? objectId;
  String? name;
  String? email;
  String? password;
  String? phone;
  UserType? userType;
  DateTime? createdAt;
  User({this.name, this.email, this.password, this.phone, this.userType = UserType.PARTICULAR, this.objectId, this.createdAt});



}