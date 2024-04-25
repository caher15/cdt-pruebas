import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:upload_images/services/select_images.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upload_images/services/uploas_images.dart';


class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  File? imagen_to_upload;    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),

      body: Column(
        children: [
          imagen_to_upload != null ? Image.file(imagen_to_upload!):  Container(
            margin: const EdgeInsets.all(10),
            height: 200,
            width: double.infinity,
            color: Colors.red,
          ),
        
          Padding(
            padding: const EdgeInsets.only(bottom:  20.0, top: 8.0),
            child: ElevatedButton(onPressed: () async
            {
              final imagen = await getImage();

              setState(() {
                imagen_to_upload = File(imagen!.path);
              });
            },
             child: const Text("Seleccionar Imagen")),
          ),
          
          ElevatedButton(onPressed: ()async
          {
            if( imagen_to_upload == null){
              return;
            }
            final uploaded = await uploadImage(imagen_to_upload!);

            if (uploaded) 
            {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Imagen subida correctamente")));
              
            }

          },
           child: const Text("Subir a Firebase")),
          
        ],
      ),
    );
  }
}