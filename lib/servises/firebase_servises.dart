import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> listar() async{
  List personas = [];
  CollectionReference collectionReferencePersonas=db.collection('personas');
  QuerySnapshot queryPersonas = await collectionReferencePersonas.get();
  queryPersonas.docs.forEach((documento){
    personas.add(documento.data());
  });
  return personas;
}

Future<void> guardarPersona(String nombre) async{
  await db.collection("personas").add({"name": nombre});
}
