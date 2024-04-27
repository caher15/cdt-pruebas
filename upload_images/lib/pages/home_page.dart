import 'package:flutter/material.dart';
import 'package:upload_images/services/firebase_service.dart';


class HomeLogin extends StatefulWidget {
  const HomeLogin({super.key});

  @override
  State<HomeLogin> createState() => _HomeLoginState();
}

class _HomeLoginState extends State<HomeLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: FutureBuilder(
        
        future: getUsers(), 
        builder: ((context, snapshot){
          if(snapshot.hasData){
            return ListView.builder
            (itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return Dismissible(
                onDismissed: (direction)async{
                  await deletePeople(snapshot.data?[index]['uid']);//Función para eliminar
                  snapshot.data?.removeAt(index); //Recordar remover del snapshot tmb
                },
                confirmDismiss: (direction) async{
                  bool result = false;
                  result = await showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text("¿Está seguro que quiere eliminar a ${snapshot.data?[index]['name']}?"),
                      actions: [
                        TextButton(onPressed:(){
                          return Navigator.pop(
                            context,
                            false,
                            );
                        }, child: const Text("Cancelar")),
                        TextButton(onPressed:(){
                          return Navigator.pop(
                            context,
                            true,
                            );
                        }, child: const Text("Aceptar")),
                      ],
                    );
                  });
                  return result;
                },
                key: Key(snapshot.data?[index]['uid']),
                background: Container(
                  color: Colors.red.shade300,
                  child: const Icon(Icons.delete),

                ),
                direction: DismissDirection.endToStart,
                child: ListTile(
                  title: Text(snapshot.data?[index]['name']),
                  onTap: (() async {
                    await Navigator.of(context).pushNamed(
                    '/edit', // Asegúrate de que este es el nombre de ruta correcto.
                    arguments: {
                      'name': snapshot.data?[index]['name'],
                       'uid': snapshot.data?[index]['uid'],
                    },
                  );
                  setState(() {
                  });
                  }
                )),
              );
          }
          );
        }else{
          return const Center(
            child: CircularProgressIndicator(),
            );
        }

        
      })),
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        await Navigator.pushNamed(context, '/add');
        setState(() {
      // Update your state here. This will be called after returning from the '/add' route.
      });
        
      },
        child: const Icon(Icons.add),
      ),
    );
  }
    
  }