import 'package:flutter/material.dart';
import 'package:flutter_application_1/dominio/caso_de_uso/data/adaptadores.dart';
import 'package:flutter_application_1/dominio/entidades/libro.dart';

class CrearLibroPage extends StatelessWidget {
  const CrearLibroPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nombreLibro = TextEditingController();

    void guardarLibro() async {
      List<Libro> librosFirebase = await adaptadorFirebase.todosLosLibros();
      int newId = librosFirebase.length + 1;
      Libro newLibro = Libro(newId, nombreLibro.text, true);
      adaptadorFirebase.agregarLibro(newLibro);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: const Color.fromARGB(255, 97, 41, 37),
        content: const Text("Libro registrado con exito"),
        action: SnackBarAction(
          textColor: Colors.white,
          label: "cerrar",
          onPressed: () {},
        ),
      ));
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: const Text("Añadir un Libro", style: TextStyle(fontSize: 35)),
          centerTitle: true),
      body: Center(
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Nombre del libro",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  TextField(
                      controller: nombreLibro,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white)),
                  const SizedBox(height: 50)
                ],
              ),
              ElevatedButton(
                  onPressed: guardarLibro,
                  child: const Text("ACEPTAR",
                      style: TextStyle(fontSize: 20, color: Colors.black)))
            ],
          ),
        ),
      ),
    );
  }
}
