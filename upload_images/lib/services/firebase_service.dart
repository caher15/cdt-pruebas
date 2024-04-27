import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//Funcion para leer los datos de firestore
Future<List<Map<String, dynamic>>> getUsers() async {
  try {
    CollectionReference collectionReferenceUsers = db.collection('people');
    QuerySnapshot queryUsers = await collectionReferenceUsers.get();//query de ejemplo solo trae todos los datos de firestore "get()"
    return queryUsers.docs.map((documento) {
      final data = documento.data() as Map<String, dynamic>;
      return {
        "name": data['name'],
        "uid": documento.id,
      };
    }).toList();
  } catch (e) {
    // Manejar el error, por ejemplo, imprimiendo el error o
    // devolviendo una lista vacía como fallback
    print(e);
    return [];
  }
}

//Funcion para guarda en base de datos
Future<void> addUsers(String name) async{
  await db.collection("people").add({'name': name});
}
//Función para editar datos de la base de datos
Future<void> updatePeople(String uid, String newName) async{
  await db.collection("people").doc(uid).update({"name" : newName});
}

//Función para borrar datos de la base de datos
Future<void> deletePeople(String uid)async{
  await db.collection("people").doc(uid).delete();
}

