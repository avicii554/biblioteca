import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentacion/mostrar_libros.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Menu",
          style: TextStyle(
            color: Color.fromARGB(255, 87, 138, 154),
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(115, 128, 77, 26),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MostrarLibros()));
                  },
                  child: const Text("Mostrar los Libro")),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text("agregar libro")),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text("mostrar todos los usuarios")),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text("agregar usuario")),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text("registro del retiro del libro")),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text("registrar la devolucion de un libro")),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text("mostrar todo los libros no devueltos")),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: const Text("salir de la app")),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
