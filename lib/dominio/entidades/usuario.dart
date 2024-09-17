class Usuario {
  int dni;
  String nombre;
  String apellido;
  int telefono;
  String email;

  Usuario(this.dni, this.nombre, this.apellido, this.telefono, this.email);

  Map<String, dynamic> toMap() {
    return {
      "nombre": nombre,
      "apellido": apellido,
      "dni": dni,
      "telefono": telefono,
      "email": email
    };
  }
}
