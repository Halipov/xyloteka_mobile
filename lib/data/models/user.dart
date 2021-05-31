import 'dart:convert';

class User {
  int? id;
  String? firstName;
  String? secondName;
  String? lastName;
  String? organization;
  String? username;
  String? password;
  String? email;
  String? phone;
  String? about;

  User({
    this.id,
    this.firstName,
    this.secondName,
    this.lastName,
    this.organization,
    this.username,
    this.password,
    this.email,
    this.phone,
    this.about,
  });

  User copyWith({
    int? id,
    String? firstName,
    String? secondName,
    String? lastName,
    String? organization,
    String? username,
    String? password,
    String? email,
    String? phone,
    String? about,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      secondName: secondName ?? this.secondName,
      lastName: lastName ?? this.lastName,
      organization: organization ?? this.organization,
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      about: about ?? this.about,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'secondName': secondName,
      'lastName': lastName,
      'organization': organization,
      'username': username,
      'password': password,
      'email': email,
      'phone': phone,
      'about': about,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      lastName: map['lastName'],
      organization: map['organization'],
      username: map['username'],
      password: map['password'],
      email: map['email'],
      phone: map['phone'],
      about: map['about'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, secondName: $secondName, lastName: $lastName, organization: $organization, username: $username, password: $password, email: $email, phone: $phone, about: $about)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.firstName == firstName &&
        other.secondName == secondName &&
        other.lastName == lastName &&
        other.organization == organization &&
        other.username == username &&
        other.password == password &&
        other.email == email &&
        other.phone == phone &&
        other.about == about;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        secondName.hashCode ^
        lastName.hashCode ^
        organization.hashCode ^
        username.hashCode ^
        password.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        about.hashCode;
  }
}
