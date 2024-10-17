import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/services/auth_service.dart';

class FirestoreService {

var db = FirebaseFirestore.instance;

postFeedback(message) async{

  db.collection('Feedbacks').add({
    "user": await FirebaseAuthService().checkUser(),
    "message": message,
    "photo":"",
    "created_at":DateTime.now()
  });


}

getFeedback() async {
  try{
    var feedbacks = await db.collection('Feedbacks').orderBy('created_at', descending: true).get();
    print(feedbacks.docs);
    return feedbacks.docs;
  } catch (e) {
    throw e;
  }
}

}