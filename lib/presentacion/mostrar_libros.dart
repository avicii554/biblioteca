import 'package:flutter/material.dart';
import 'package:flutter_application_1/dominio/caso_de_uso/data/adaptadores.dart';

class MostrarLibros extends StatelessWidget {
  const MostrarLibros({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("Lista de Libros", style: TextStyle(fontSize: 35)),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: adaptadorFirebase.todosLosLibros(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: const EdgeInsets.only(top: 30),
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Column(
                      children: [
                        Container(
                          width: 500,
                          color: const Color.fromARGB(255, 165, 190, 166),
                          child: Center(
                            child: Text(
                              snapshot.data![index].nombre,
                              style: const TextStyle(
                                  fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30)
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

extension on Object? {
  get length => null;
}
