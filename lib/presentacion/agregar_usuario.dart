import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/dominio/caso_de_uso/data/adaptadores.dart';
import 'package:flutter_application_1/dominio/entidades/usuario.dart';

class CrearUsuarioPage extends StatelessWidget {
  const CrearUsuarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController dniController = TextEditingController();
    TextEditingController nombreController = TextEditingController();
    TextEditingController apellidoController = TextEditingController();
    TextEditingController telefonoController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    bool casillasRellenadas() {
      if (dniController.text == "" ||
          nombreController.text == "" ||
          apellidoController.text == "" ||
          telefonoController.text == "" ||
          emailController.text == "") {
        return false;
      }

      return true;
    }

    void guardarDatos() {
      if (casillasRellenadas()) {
        Usuario newUsuario = Usuario(
            int.parse(dniController.text),
            nombreController.text,
            apellidoController.text,
            int.parse(telefonoController.text),
            emailController.text);

        adaptadorFirebase.agregarUsuario(newUsuario);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: const Color.fromARGB(255, 97, 41, 37),
          content: const Text("Usuario registrado con exito"),
          action: SnackBarAction(
            textColor: Colors.white,
            label: "cerrar",
            onPressed: () {},
          ),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: const Color.fromARGB(255, 97, 41, 37),
          content: const Text(
              "Rellene todas las casillas para registrar un usuario"),
          action: SnackBarAction(
            textColor: Colors.white,
            label: "cerrar",
            onPressed: () {},
          ),
        ));
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("Crear usuario"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "D.N.I",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: dniController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Nombre",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: nombreController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Apellido",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: apellidoController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Telefono",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: telefonoController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Email",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 400,
              child: ElevatedButton(
                  onPressed: guardarDatos,
                  child: const Text("ACEPTAR",
                      style: TextStyle(color: Colors.black, fontSize: 20))),
            )
          ],
        ),
      ),
    );
  }
}
