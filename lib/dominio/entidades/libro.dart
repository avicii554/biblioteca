class Libro {
  int id;
  String nombre;
  bool disponible;

  Libro(this.id, this.nombre, this.disponible);

  Map<String, dynamic> toMap() {
    return {"nombre": nombre, "disponible": disponible, "id": id};
  }
}
