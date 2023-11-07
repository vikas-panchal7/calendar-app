import 'package:calendar_app/services/firebase_helper/firebase_firestore_helper.dart';
import 'package:calendar_app/services/firebase_helper/user_document.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final userCollectionRef = FirebaseFireStoreHelper.userCollectionRef;
  final userRef = FirebaseFireStoreHelper.userRef;

  Future<bool> createUser({
    required String userName,
    required String gmail,
    required LoginType loginType,
    required String id,
  }) async {
    var data = {
      UserInfoDocumentFields.gmail: gmail,
      UserInfoDocumentFields.userName: userName,
      UserInfoDocumentFields.createdAt: DateTime.timestamp(),
      UserInfoDocumentFields.updatedAt: DateTime.timestamp(),
      UserInfoDocumentFields.loginType: loginType.name,
    };

    await userCollectionRef
        .doc(id)
        .set(data)
        .onError((error, stackTrace) => false);

    return true;
  }
  String getUserDetailId() => userCollectionRef.doc().id;
  Future<UserInfo> getUserDetails({required String gmail}) async {
    var query =
        userRef.where(Filter(UserInfoDocumentFields.gmail, isEqualTo: gmail));

    var result = await query.get();
    return result.docs.first.data();
  }

  Future<bool> checkIfUserLoggedIn({required String gmail}) async {
    var query =
        userRef.where(Filter(UserInfoDocumentFields.gmail, isEqualTo: gmail));

    var result = await query.get();
    return result.docs.isNotEmpty;
  }
}
