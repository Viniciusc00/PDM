import 'package:app_comida/src/feature/login/view/page/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;
/*
  AuthService authService = AuthService();

  void registerUser() async {
    if (nomeController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      authService.cadastraUsuario(
          nome: nomeController.text,
          email: emailController.text,
          senha: passwordController.text);
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }*/
  Future registerUser() async {
    if (nomeController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      final docCliente = FirebaseFirestore.instance
          .collection('cliente')
          .doc(emailController.text);
      var json = {
        "nome": nomeController.text,
        "email": emailController.text,
        "password": passwordController.text
      };

      await docCliente.set(json);

      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              alignment: const Alignment(0.0, 1.15),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "lib/assets/images/login_imagens/perfil_foto.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Container(
                height: 56,
                width: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1.0],
                    colors: [
                      Colors.red,
                      Color.fromARGB(255, 138, 64, 64),
                    ],
                  ),
                  border: Border.all(
                    width: 4.0,
                    color: const Color(0xFFFFFFFF),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(56),
                  ),
                ),
                child: SizedBox.expand(
                  child: TextButton(
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              // autofocus: true,
              controller: nomeController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                errorText: _isNotValidate ? "Insira nome novamente" : null,
                labelText: "Nome",
                labelStyle: const TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              // autofocus: true,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,

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
              style: const TextStyle(
                fontSize: 20,
              ),
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
            const SizedBox(
              height: 10,
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
                    "Cadastrar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    registerUser();
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: const button_signup_leave(),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class button_signup_leave extends StatelessWidget {
  const button_signup_leave({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text(
        "Cancelar",
        textAlign: TextAlign.center,
      ),
      onPressed: () => Navigator.pop(context, false),
    );
  }
}
