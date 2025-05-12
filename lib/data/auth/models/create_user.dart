class UserCreateReq {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  int? gender;
  String? age;

  UserCreateReq(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.gender,
      this.age});
}
