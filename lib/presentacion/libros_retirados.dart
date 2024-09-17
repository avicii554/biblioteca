import 'package:flutter/material.dart';
import 'package:flutter_application_1/dominio/caso_de_uso/data/adaptadores.dart';
import 'package:flutter_application_1/dominio/entidades/libro.dart';
import 'package:flutter_application_1/dominio/entidades/usuario.dart';
import 'package:flutter_application_1/presentacion/principal.dart';

class RegistrarDevolucionPage extends StatefulWidget {
  const RegistrarDevolucionPage({super.key});

  @override
  State<RegistrarDevolucionPage> createState() =>
      _RegistrarDevolucionPageState();
}

class _RegistrarDevolucionPageState extends State<RegistrarDevolucionPage> {
  int indexUsuarioSeleccionado = -1;
  int indexLibroSeleccionado = -1;
  List<Libro> librosNoDisponibles = [];

  void regitrarDevolucion() async {
    if (indexLibroSeleccionado >= 0 && indexUsuarioSeleccionado >= 0) {
      DateTime fecha = DateTime.now();
      List<Usuario> listaUsuariosFirebase =
          await adaptadorFirebase.todosLosUsuarios();
      List<Libro> listaLibrosFirebase =
          await adaptadorFirebase.todosLosLibrosNoVueltos();

      Usuario usuario = listaUsuariosFirebase[indexUsuarioSeleccionado];
      Libro libro = listaLibrosFirebase[indexLibroSeleccionado];

      adminsBiblioteca.registrarDevolucionDeLibro(fecha, libro, usuario);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: const Color.fromARGB(255, 97, 41, 37),
        content: const Text("Delovucion de un libro registrado con exito!"),
        action: SnackBarAction(
          textColor: Colors.white,
          label: "cerrar",
          onPressed: () {},
        ),
      ));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Principal()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: const Text(
            "Seleccione un usuario y libro para registrar la devolución"),
        action: SnackBarAction(
          textColor: Colors.white,
          label: "cerrar",
          onPressed: () {},
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 71, 71, 71),
      appBar: AppBar(
        title: const Text("Registrar Devolucion"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: [
                  const Text("Usuarios",
                      style: TextStyle(fontSize: 30, color: Colors.white)),
                  ListaUsuarios()
                ]),
                const SizedBox(width: 10),
                Column(children: [
                  const Text("Libros",
                      style: TextStyle(fontSize: 30, color: Colors.white)),
                  ListaLibros()
                ]),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 500,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: regitrarDevolucion,
                child: const Text(
                  "REGISTRAR",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container ListaUsuarios() {
    return Container(
      width: 500,
      height: 500,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 112, 112, 112),
          borderRadius: BorderRadius.circular(5)),
      child: FutureBuilder(
        future: adaptadorFirebase.todosLosUsuarios(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  Usuario user = snapshot.data![index];
                  return SizedBox(
                    height: 100,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: index == indexUsuarioSeleccionado
                                ? Colors.red
                                : const Color.fromARGB(255, 134, 134, 134),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          setState(() {
                            if (index != indexUsuarioSeleccionado) {
                              indexUsuarioSeleccionado = index;
                            } else {
                              indexUsuarioSeleccionado = -1;
                            }
                          });
                        },
                        child: Text(
                            "${user.nombre} ${user.apellido}\nD.N.I: ${user.dni}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15))),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              );
            } else {
              return const Center(
                  child: Text(
                "No hay Usuarios",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ));
            }
          } else {
            return const CircularProgressIndicator(color: Colors.white);
          }
        },
      ),
    );
  }

  Container ListaLibros() {
    Color colorSeleccion(index) {
      if (index == indexLibroSeleccionado) {
        return Colors.red;
      }

      return const Color.fromARGB(255, 134, 134, 134);
    }

    return Container(
        width: 500,
        height: 500,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 112, 112, 112),
            borderRadius: BorderRadius.circular(5)),
        child: FutureBuilder(
          future: adaptadorFirebase.todosLosLibrosNoVueltos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                return ListView.separated(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      Libro libro = snapshot.data![index];
                      return SizedBox(
                        height: 100,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: colorSeleccion(index),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              setState(() {
                                if (index != indexLibroSeleccionado) {
                                  indexLibroSeleccionado = index;
                                } else {
                                  indexLibroSeleccionado = -1;
                                }
                              });
                            },
                            child: Text(libro.nombre,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15))),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider());
              } else {
                return const Center(
                    child: Text(
                  "No hay libros",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ));
              }
            } else {
              return const CircularProgressIndicator(color: Colors.white);
            }
          },
        ));
  }
}
