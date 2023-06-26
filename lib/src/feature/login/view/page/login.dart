
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appComida/src/feature/login/view/page/cadastro.dart';
import 'package:appComida/src/feature/login/view/page/reset_password.dart';

import '../../../home/view/widget/restaurantes.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // ignore: prefer_final_fields
  bool _isNotValidate = false;

  late SharedPreferences prefs;

  Future<bool> clienteExiste(String email, String password) async {
    // Get a reference to the Firestore collection
    CollectionReference clientesRef =
        FirebaseFirestore.instance.collection('cliente');

    // Perform the query
    QuerySnapshot snapshot = await clientesRef
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .limit(1)
        .get();

    // Check if any documents are returned
    print(email);
    print(password);
    print(snapshot.docs);

    return snapshot.docs.isNotEmpty;
  }

  String generateJwtToken(String secretKey) {
    final jwt = JWT(
      {
        'iss': 'your_issuer',
        'sub': 'your_subject',
        'aud': 'your_audience',
        'exp': DateTime.now().add(const Duration(hours: 1)).millisecondsSinceEpoch ~/
            1000,
        'iat': DateTime.now().millisecondsSinceEpoch ~/ 1000,
      },
    );

    final token = jwt.sign(SecretKey(secretKey));

    return token;
  }

  void loginUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      bool clienteExists =
          await clienteExiste(emailController.text, passwordController.text);
      if (clienteExists) {
        var myToken = generateJwtToken(passwordController.text);
        if (kDebugMode) {
          print("-----------------Token_jwt");
        }
        if (kDebugMode) {
          print(myToken);
        }

        prefs.setString('token', myToken);

        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const UserRestaurante()));
      } else {
        if (kDebugMode) {
          print("Algo esta errado");
        }
      }
    }
  }
  
  @override
  void initState() {
    super.initState();
    initSharedPref();
  }
  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }
/*
  AuthService authService = AuthService();
  
  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      authService.logarUsuario(email: emailController.text, senha: passwordController.text);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: Image.asset("lib/assets/images/login_imagens/L.png"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              // autofocus: true,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                        if (value == null || value == "") {
                          return "O valor de e-mail deve ser preenchido";
                        }
                        if (!value.contains("@") ||
                            !value.contains(".") ||
                            value.length < 4) {
                          return "O valor do e-mail deve ser válido";
                        }
                        return null;
                      },
              decoration: InputDecoration(
                filled: true,
                errorText: _isNotValidate ? "Insira nome novamente" : null,
                labelText: "E-mail",
                labelStyle: const TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              // autofocus: true,
              controller: passwordController,
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: (value) {
                        if (value == null || value.length < 6) {
                          return "Insira uma senha válida.";
                        }
                        return null;
                      },
              decoration: InputDecoration(
                filled: true,
                errorText: _isNotValidate ? "Insira nome novamente" : null,
                labelText: "Senha",
                labelStyle: const TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(fontSize: 20),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: const button_recovery_password(),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Colors.red,
                    Color.fromARGB(255, 138, 64, 64),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                  child: TextButton(
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Icon(Icons.restaurant, color: Colors.white),
                    )
                  ],
                ),
                onPressed: () {
                  loginUser();
                },
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 40,
              child: button_signup(),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class button_signup extends StatelessWidget {
  const button_signup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text(
        "Cadastre-se",
        textAlign: TextAlign.center,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignupPage(),
          ),
        );
      },
    );
  }
}

// ignore: camel_case_types
class button_recovery_password extends StatelessWidget {
  const button_recovery_password({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text(
        "Recuperar Senha",
        textAlign: TextAlign.right,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ResetPasswordPage(),
          ),
        );
      },
    );
  }
}
