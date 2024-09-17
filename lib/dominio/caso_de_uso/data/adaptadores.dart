import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/dominio/caso_de_uso/administracion_de_biblioteca.dart';
import 'package:flutter_application_1/dominio/caso_de_uso/data/adaptadores/adaptador_biblioteca_firebase.dart';

//AdaptadorBibliotecaMemoria adaptadorMemoria = AdaptadorBibliotecaMemoria();

AdaptadorBibliotecaFirebase adaptadorFirebase = AdaptadorBibliotecaFirebase();

AdministracionDeBiblioteca adminsBiblioteca =
    AdministracionDeBiblioteca(adaptadorFirebase: adaptadorFirebase);

CollectionReference coleccionLibros =
    FirebaseFirestore.instance.collection("Libros");

CollectionReference coleccionUser =
    FirebaseFirestore.instance.collection("Usuarios");

CollectionReference coleccionMovimiento =
    FirebaseFirestore.instance.collection("Movimientos");
