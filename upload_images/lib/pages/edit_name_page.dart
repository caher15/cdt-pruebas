import 'package:flutter/material.dart';
import 'package:upload_images/services/firebase_service.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key});

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {

  TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {

    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map? ?? {};
      if (arguments.containsKey('name')) {
        nameController.text = arguments['name'];
      }
    return Scaffold(
      body:Padding(padding: const EdgeInsets.all(20.0),
        child: 
         Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'Ingrese la modificación'
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 15)),
          ElevatedButton(
            onPressed: () async{
              
              await updatePeople(arguments['uid'], nameController.text).then((_){
                Navigator.pop(context);
              });
            },  
            child: const Text("Actualizar"))
        ],
        ),
      ),
    );
  }
}