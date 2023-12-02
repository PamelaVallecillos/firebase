import 'package:flutter_application_1/servises/firebase_servises.dart';
import 'package:flutter/material.dart';

class NuevaPersona extends StatefulWidget{
  const NuevaPersona({super.key});

  @override
  State<NuevaPersona> createState() => _NuevaPersonaState();
}

class _NuevaPersonaState extends State<NuevaPersona>{
  TextEditingController nameController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Crear")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: "Escrone un nombre"),
          ),
          ElevatedButton(
            onPressed: () async {
              await guardarPersona(nameController.text).then((value) {
                Navigator.pop(context);
              });
            },
            child: const Text("Guardar"),
            )
        ],),
        ),
    );
  }
}




