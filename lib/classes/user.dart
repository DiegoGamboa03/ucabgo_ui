/// Almacena toda los datos de los distintos usuarios que hay en
/// la aplicacion
class User {
  // Propiedades
  String id;
  String password;
  String name;

  ///TODO agregar campos que se extraigan de la base de datos
  ///
  User({this.id = '0', this.password = '0', required this.name});
}
