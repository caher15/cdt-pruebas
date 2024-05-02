import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:upload_images/authentication/singup_screen.dart';
import 'package:upload_images/global/global.dart';
import 'package:upload_images/mainScreens/menu_screen.dart';
import 'package:upload_images/splashScreen/splash_screen.dart';
import 'package:upload_images/widgets/colors.dart';
import 'package:upload_images/widgets/progress_dialog.dart';
class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override

  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {

  bool _obscureText = true;

  TextEditingController passwordtextEditingController  = TextEditingController();
  TextEditingController emalitextEditingController  = TextEditingController();

  void validateForm()
  {
    String email = emalitextEditingController.text.trim();
    String password = passwordtextEditingController.text.trim();

    if(!emalitextEditingController.text.contains("@")){
      Fluttertoast.showToast(msg: "La dirección de correo No es valida");
    }else if(passwordtextEditingController.text.length <6){
      Fluttertoast.showToast(msg: "La contrasela debe ser mayor a 6 caracteres.");
    }else{
      loginUserNow(email, password);
    }

  }
    void loginUserNow(String email, String password)async{
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
            return ProgressDialog(message: "Cargando, Por Favor Espere...",);
        }
    );
    try {
    final UserCredential userCredential = await fAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final User? firebaseUser = userCredential.user;

    // Check if user authentication was successful
    if (userCredential.user != null) {
      currentFirebaseUser = firebaseUser;
      Navigator.pop(context); // Close progress dialog
      Fluttertoast.showToast(msg: "Inicio de sesión Exitoso");
      Navigator.push(context, MaterialPageRoute(builder: (c) => const MainScreen()));
    } 
  } on FirebaseAuthException catch (e) {
    Navigator.pop(context); // Close progress dialog

    if (e.code == 'user-not-found') {
      Fluttertoast.showToast(msg: "El usuario no exite.");
    } else if (e.code == 'wrong-password') {
      Fluttertoast.showToast(msg: "Contraseña incorrecta.");
    } else {
      Fluttertoast.showToast(msg: "Error; ${e.message}");
    }
  } catch (error) {
    Navigator.pop(context); // Close progress dialog
    Fluttertoast.showToast(msg: "Erro; $error");
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
            child:  OverflowBox(
              maxWidth: 350,
              maxHeight: double.infinity,
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
                        "Hola, Inicia sesión",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                   
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
                        border: const OutlineInputBorder(
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
                        onPressed: () {
                          validateForm();
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(AppColors.secondaryColor),
                          // Add other desired button style properties here
                        ),
                        child: const Text(
                          "Iniciar Sesion",
                          style: TextStyle(fontSize: 18, color: AppColors.primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: ()
                      {
                        Navigator.push(context, PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => const SingupScreen(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            var begin = const Offset(1.0, 0.0);  
                            var end = Offset.zero;
                            var curve = Curves.ease;

                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                        ));
                      },
                      child: const Text(
                        "New at CDT? SingUp Here",
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