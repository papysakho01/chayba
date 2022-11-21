import 'package:emart_app/consts/consts.dart';

class FirestoreSerices {
  static getUser(uid) {
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
}
