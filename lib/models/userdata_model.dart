class UserDataModel {
  int? id;
  String? email;
  String? fName;
  String? lName;
  String? image;

  UserDataModel({
    required this.id,
    required this.email,
    required this.fName,
    required this.lName,
    required this.image,
  });

  factory UserDataModel.formJson(Map<String, dynamic> data) {
    return UserDataModel(
      id: data['id'],
      email: data['email'],
      fName: data['first_name'],
      lName: data['last_name'],
      image: data['avatar'],
    );
  }
}
