import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:appComida/src/feature/login/view/widget/button_signup.dart';
import 'package:appComida/src/feature/login/view/widget/button_recovery_password.dart';
import 'package:appComida/src/feature/home/view/page/homepage.dart';
import 'package:http/http.dart' as http;
import 'package:appComida/src/feature/login/config_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;

  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPref();
  }
  void initSharedPref()async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty){


       var regBody = {
        "email": emailController.text,
        "password": passwordController.text
      };

      var response = await http.post(Uri.parse(login),
          headers: {"Content-Type": "application/json"},
          body: json.encode(regBody),
          
          );

        var jsonResponse = jsonDecode(response.body);

        if(jsonResponse['status'])
        {
        var myToken = jsonResponse['token'];
        print("-----------------Token_jwt");
        print(myToken);

        prefs.setString('token', myToken);

        Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));

      }else{
        print("Algo esta errado");
      }
    }
     
  }

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
                child: Image.asset("lib/assets/images/login_imagens/L.png"),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              // autofocus: true,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                errorText: _isNotValidate ? "Insira nome novamente" : null,
                labelText: "E-mail",
                labelStyle: TextStyle(
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
              decoration: InputDecoration(
                filled: true,
                errorText: _isNotValidate ? "Insira nome novamente" : null,
                labelText: "Senha",
                labelStyle: TextStyle(
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
                  child: Row(
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
                Container(
                  child: SizedBox(
                    child: Icon(Icons.restaurant, color :Colors.white),
                    height: 60,
                    width: 60,
                  ),
          )
        ],
      ),
      onPressed: () {
        loginUser();
      },
    )
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              child: button_signup(),
            ),
          ],
        ),
      ),
    );
  }
}
