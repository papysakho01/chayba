import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';

class FirestoreServices {
  static getUser(uid) {
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  static getProducts(String? title) {
    return firestore
        .collection(productsCollection)
        .where('p_category', isEqualTo: categories)
        .snapshots();
  }
}
