import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:appComida/src/feature/login/config_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:appComida/src/feature/login/view/page/login.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {

  TextEditingController emailController = TextEditingController();
  
  bool _isNotValidate = false;

  late SharedPreferences prefs;

  void recoverPassword() async {
    if (emailController.text.isNotEmpty) {
      var regBody = {
        "email": emailController.text,
      };

      var response = await http.post(Uri.parse(recoverpassword),
          headers: {"Content-Type": "application/json"},
          body: json.encode(regBody),
          
          );

      var jsonResponse = jsonDecode(response.body);
      

      if(jsonResponse['status'])
      {
        Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginPage()));
      }else{
        print("Algo esta errado");
      }

    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset("lib/assets/images/login_imagens/reset-password-icon.png"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Esqueceu sua senha?",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Por favor, informe o E-mail associado a sua conta que enviaremos um link para o mesmo com as instruções para restauração de sua senha.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration:  InputDecoration(
                          filled: true,
                          errorText: _isNotValidate ? "Insira E-mail novamente" : null,
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
                        height: 20,
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
                            child: const Text(
                              "Enviar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              recoverPassword();
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
