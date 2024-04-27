
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:upload_images/global/global.dart';
import 'package:upload_images/mainScreens/menu_screen.dart';
import 'package:upload_images/widgets/progress_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SingupScreen extends StatefulWidget 
{
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> 
{
  TextEditingController nametextEditingController  = TextEditingController();
  TextEditingController emalitextEditingController  = TextEditingController();
  TextEditingController phonetextEditingController  = TextEditingController();
  TextEditingController passwordtextEditingController  = TextEditingController();

  validateForm(){
    if(nametextEditingController.text.length < 3){
      Fluttertoast.showToast(msg: "name must be at least 3 Characters.");
      
    }else if(!emalitextEditingController.text.contains("@")){
      Fluttertoast.showToast(msg: "Email address is not valid.");
    }else if(phonetextEditingController.text.isEmpty){
      Fluttertoast.showToast(msg: "Phone number is required.");
    }else if(passwordtextEditingController.text.length <6){
      Fluttertoast.showToast(msg: "Password must be at least 6 Characters.");
    }
    else
    {
      saveDriverInfo();
    }

  }
  
saveDriverInfo() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
            return ProgressDialog(message: "Processing, Please wait...",);
        }
    );

    try {
        final UserCredential userCredential = await fAuth.createUserWithEmailAndPassword(
            email: emalitextEditingController.text.trim(),
            password: passwordtextEditingController.text.trim(),
        );

        final User? firebaseUser = userCredential.user;

        if (firebaseUser != null) {
            Map<String, dynamic> userMap = {
                "id": firebaseUser.uid,
                "name": nametextEditingController.text.trim(),
                "email": emalitextEditingController.text.trim(),
                "phone": phonetextEditingController.text.trim(),
            };

            FirebaseFirestore.instance.collection("people").doc(firebaseUser.uid).set(userMap);

            currentFirebaseUser = firebaseUser;
            Fluttertoast.showToast(msg: "Account has been Successfully Created.");
            Navigator.push(context, MaterialPageRoute(builder: (c) => MainScreen()));
        } else {
            Navigator.pop(context);
            Fluttertoast.showToast(msg: "Account has not been Created.");
        }
    } catch (error) {
        Navigator.pop(context); // Cerrar el diálogo de progreso en caso de error
        Fluttertoast.showToast(msg: "Error: $error", timeInSecForIosWeb: 10);
    }
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Colors.white,
  body: SafeArea(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Imagen de fondo antes del contenedor del formulario
        Image.asset(
          "images/3_1.png",
          height: 300,
          fit: BoxFit.fill,
        ),
        // Contenedor para el formulario
        Expanded(
          child: Container(
            
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hola, Bienvenido",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: nametextEditingController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      hintText: "Enter your name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: emalitextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: phonetextEditingController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Phone",
                      hintText: "Enter your phone number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passwordtextEditingController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: validateForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreenAccent,
                    ),
                    child: const Text(
                      "Create Account",
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (c) => const MainScreen()));
                    },
                    child: const Text(
                      "Already have an Account? Login here",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  ),
);



  }
}
