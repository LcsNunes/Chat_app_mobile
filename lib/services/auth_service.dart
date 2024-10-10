import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService{

  FirebaseAuth auth = FirebaseAuth.instance;

  login() async {

   try {
    var user = await auth.signInWithEmailAndPassword(
        email: 'lucas_p_nunes@estudante.sesisenai.org.br',
        password: '789456123');
      return user;
     
   } catch (e) {
    throw e;
     
   }

  }

  recoverPassword () async {
    try {
    await auth.sendPasswordResetEmail (
        email: 'lucas_p_nunes@estudante.sesisenai.org.br',);       
      return true;
     
   } catch (e) {
    throw e;
     
   }

  }



  checkUser() async{
    var user = auth.currentUser!.displayName;
    return user;
  }

}