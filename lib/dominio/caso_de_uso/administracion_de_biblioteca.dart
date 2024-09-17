import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/dominio/caso_de_uso/data/adaptadores.dart';
import 'package:flutter_application_1/dominio/caso_de_uso/data/adaptadores/adaptador_biblioteca_firebase.dart';
import 'package:flutter_application_1/dominio/entidades/libro.dart';
import 'package:flutter_application_1/dominio/entidades/movimiento.dart';
import 'package:flutter_application_1/dominio/entidades/usuario.dart';

class AdministracionDeBiblioteca {
  AdaptadorBibliotecaFirebase adaptadorFirebase = AdaptadorBibliotecaFirebase();
  AdministracionDeBiblioteca({required this.adaptadorFirebase});

  void registrarEntregaDeLibro(
      DateTime fecha, Libro libro, Usuario usuario) async {
    //List<Libro> listaLibro = await adaptadorFirebase.todosLosLibros();

    QuerySnapshot querySnapshot = await coleccionLibros.get();

    for (var element in querySnapshot.docs) {
      Map<String, dynamic> datos = element.data() as Map<String, dynamic>;

      if (datos["nombre"] == libro.nombre) {
        String IdDocumento = element.id;
        coleccionLibros.doc(IdDocumento).update({"disponible": false});
      }
    }

    MovimientoDeBiblioteca nuevoMovimiento =
        MovimientoDeBiblioteca(fecha, usuario, libro, false);

    adaptadorFirebase.agregarMovimiento(nuevoMovimiento);
  }

  void registrarDevolucionDeLibro(
      DateTime fecha, Libro libro, Usuario usuario) async {
    QuerySnapshot querySnapshot = await coleccionLibros.get();

    for (var element in querySnapshot.docs) {
      Map<String, dynamic> datos = element.data() as Map<String, dynamic>;

      if (datos["nombre"] == libro.nombre) {
        String IdDocumento = element.id;
        print(datos["nombre"]);
        coleccionLibros.doc(IdDocumento).update({"disponible": true});
      }
    }

    MovimientoDeBiblioteca nuevoMovimiento =
        MovimientoDeBiblioteca(fecha, usuario, libro, true);

    adaptadorFirebase.agregarMovimiento(nuevoMovimiento);
  }
}
