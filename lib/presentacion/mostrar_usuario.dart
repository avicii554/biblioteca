import 'package:flutter/material.dart';
import 'package:flutter_application_1/dominio/caso_de_uso/data/adaptadores.dart';
import 'package:flutter_application_1/dominio/entidades/usuario.dart';

class DevolverUsuarioPage extends StatelessWidget {
  const DevolverUsuarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            title:
                const Text("Lista de Usuarios", style: TextStyle(fontSize: 35)),
            centerTitle: true),
        body: FutureBuilder(
            future: adaptadorFirebase.todosLosUsuarios(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  padding:
                      const EdgeInsets.only(top: 30, left: 100, right: 100),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Usuario usuario = snapshot.data![index];
                    return listViewUsuario(usuario, index);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  Container listViewUsuario(Usuario usuario, int index) {
    return Container(
        height: 100,
        decoration: BoxDecoration(
            color: const Color.fromARGB(87, 141, 141, 141),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Text(
                "${usuario.dni} | ${usuario.nombre} ${usuario.apellido} | ${usuario.telefono} | ${usuario.email}",
                style: const TextStyle(fontSize: 30, color: Colors.white))));
  }
}
