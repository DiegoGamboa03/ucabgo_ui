/// Almacena toda los datos de los distintos usuarios que hay en
/// la aplicacion
class User {
  // Propiedades
  String id;
  String password;
  String name;

  ///TODO agregar campos que se extraigan de la base de datos
  ///
  User({required this.id, required this.password, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      password: json['_password'],
      name: json['name'],
    );
  }
}
