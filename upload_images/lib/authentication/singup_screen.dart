
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:upload_images/global/global.dart';
import 'package:upload_images/mainScreens/menu_screen.dart';
import 'package:upload_images/widgets/colors.dart';
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
  bool _obscureText = true;

  TextEditingController nametextEditingController  = TextEditingController();
  TextEditingController emalitextEditingController  = TextEditingController();
  TextEditingController phonetextEditingController  = TextEditingController();
  TextEditingController locationtextEditingController  = TextEditingController();
  TextEditingController passwordtextEditingController  = TextEditingController();

  validateForm(){
    if(nametextEditingController.text.length < 3){
      Fluttertoast.showToast(msg: "El nombre debe ser mayor a 3 caracteres.");
      
    }else if(!emalitextEditingController.text.contains("@")){
      Fluttertoast.showToast(msg: "La dirección de correo No es valida");
    }else if(phonetextEditingController.text.isEmpty){
      Fluttertoast.showToast(msg: "Número de celular requerido.");
    }else if(locationtextEditingController.text.isEmpty){
      Fluttertoast.showToast(msg: "El numero de la casa requerido.");
    }else if(passwordtextEditingController.text.length <6){
      Fluttertoast.showToast(msg: "La contrasela debe ser mayor a 6 caracteres.");
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
            return ProgressDialog(message: "Cargando, Por Favor Espere...",);
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
            Fluttertoast.showToast(msg: "La cuenta ha sido creada Exitosamente.");
            Navigator.push(context, MaterialPageRoute(builder: (c) => MainScreen()));
        } else {
            Navigator.pop(context);
            Fluttertoast.showToast(msg: "La cuenta no ha sido creada.");
        }
    } catch (error) {
        Navigator.pop(context); // Cerrar el diálogo de progreso en caso de error
        Fluttertoast.showToast(msg: "Error: $error", timeInSecForIosWeb: 10);
    }
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // This parent container has fixed width and
        // height of 100 pixels.
        Expanded(
          child: Container(
            
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/3_1.png"),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
                )
                ),
            // This OverflowBox imposes its own constraints of maxWidth
            // and maxHeight of 200 pixels on its child which allows the
            // child to overflow the parent container.
            child:  OverflowBox(
              maxWidth: 350,
              maxHeight: double.infinity,
              // Without the OverflowBox, the child widget would be
              // constrained to the size of the parent container
              // and would not overflow the parent container.
              child: Padding(
                padding: const EdgeInsets.only(top: 200, bottom: 20),
                child: Container(
          
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Hola, Bienvenido",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Text(
                        "Nombre completo",
                        style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                    ),
                    TextField(
                      cursorColor: AppColors.secondaryColor,
                      controller: nametextEditingController,
                      decoration: const InputDecoration(
                        labelText: "Nombre",
                        hintText: "Ingresa tu nombre",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppColors.backgroundColor,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),

                    SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Text(
                        "Correo Electronico",
                        style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                    ),

                    TextField(
                      cursorColor: AppColors.secondaryColor,
                      controller: emalitextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "Correo Electrónico",
                        hintText: "Ingresa tu correo electrónico",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppColors.backgroundColor,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),

                    SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Text(
                        "Teléfono",
                        style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                    ),
                    TextField(
                      cursorColor: AppColors.secondaryColor,
                      controller: phonetextEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: "Teléfono",
                        hintText: "Ingresa tu número de teléfono",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppColors.backgroundColor,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),

                    SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Text(
                        "Ubicación",
                        style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                    ),
                    TextField(
                      cursorColor: AppColors.secondaryColor,
                      controller: locationtextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "Ubicación",
                        hintText: "Ingresa tu ubicación",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppColors.backgroundColor,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),

                    SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Text(
                        "Contraseña",
                        style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                    ),
                    TextField(
                      cursorColor: AppColors.secondaryColor,
                      controller: passwordtextEditingController,
                      obscureText: _obscureText,
                      decoration:  InputDecoration(
                        labelText: "Contraseña",
                        hintText: "Ingresa tu contraseña",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppColors.backgroundColor,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: validateForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondaryColor,
                        ),
                        child: const Text(
                          "Create Account",
                          style: TextStyle(fontSize: 18, color: AppColors.primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: ()
                      {
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
            ),
          ),
        ),
      ],
    ),
          ),
        ),
      );
  }
}


