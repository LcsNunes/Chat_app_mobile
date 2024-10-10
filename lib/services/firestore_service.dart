import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/services/auth_service.dart';

class FirestoreService {

var db = FirebaseFirestore.instance;

postFeedback() async{

  db.collection('Feedbacks').add({
    "user": await FirebaseAuthService().checkUser(),
    "message":"Implementando firebase",
    "photo":"",
    "created_at":DateTime.now()
  });


}

}