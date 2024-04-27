import 'package:flutter/material.dart';
import 'package:upload_images/services/firebase_service.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {

  TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(padding: const EdgeInsets.all(20.0),
        child: 
         Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'Ingrese el nuevo nombre'
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 15)),
          ElevatedButton(
            onPressed: () async{
              await addUsers(nameController.text).then((_){
                Navigator.pop(context);
              });
            }, 
            child: const Text("Guardar"))
        ],
        ),
      ),
    );
  }
}