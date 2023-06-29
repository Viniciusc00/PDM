/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

class AuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  logarUsuario({required String email, required String senha}) {
    print("Teste entrar");
  }

  cadastraUsuario(
      {required String nome,
      required String email,
      required String senha}) async {

    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: senha
      );
      await userCredential.user!.updateDisplayName(nome);

    print("Teste Cadastrar");
  }
}
*/