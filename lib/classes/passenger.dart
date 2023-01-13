class Passenger {
  String username;
  String email;
  int age;
  String role;
  String gender;
  String major;
  int semester;

  Passenger(
      {required this.username,
      required this.email,
      required this.age,
      required this.role,
      required this.gender,
      required this.major,
      required this.semester});

  factory Passenger.fromJson(Map<String, dynamic> json) {
    return Passenger(
        username: json['username'],
        email: json['email'],
        age: json['age'],
        role: json['role'],
        gender: json['gender'],
        major: json['major'],
        semester: json['semester']);
  }
}
