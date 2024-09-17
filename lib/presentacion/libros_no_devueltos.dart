import 'package:flutter/material.dart';
import 'package:flutter_application_1/dominio/caso_de_uso/data/adaptadores.dart';
import 'package:flutter_application_1/dominio/entidades/libro.dart';

class LibrosFaltantesPage extends StatelessWidget {
  const LibrosFaltantesPage({super.key});
  @override
  Widget build(BuildContext context) {
    //List<Libro> librosLista = adaptadorMemoria.todosLosLibrosNoVueltos();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 58, 58, 58),
      appBar: AppBar(title: const Text("Libros faltantes"), centerTitle: true),
      body: FutureBuilder(
        future: adaptadorFirebase.todosLosLibrosNoVueltos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return Center(
                child: SizedBox(
                  width: 800,
                  child: widgetListaBuild(snapshot),
                ),
              );
            } else {
              return textNofaltanLibros();
            }
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          }
        },
      ),
    );
  }

  ListView widgetListaBuild(AsyncSnapshot snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: snapshot.data.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        Libro libroFaltante = snapshot.data[index];
        return Column(
          children: [
            containerLibrosFaltantes(libroFaltante),
          ],
        );
      },
    );
  }

  Container containerLibrosFaltantes(Libro libro) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: const Color.fromARGB(255, 85, 85, 85),
      ),
      child: Center(
        child: Text(
          libro.nombre,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Widget textNofaltanLibros() {
    return const Center(
        child: Text(
      "No faltan libros",
      style: TextStyle(fontSize: 30, color: Colors.white),
    ));
  }
}
