import 'package:calendar_app/services/firebase_helper/admin_document.dart';
import 'package:calendar_app/services/firebase_helper/firebase_firestore_helper.dart';
import 'package:calendar_app/services/firebase_helper/user_document.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminRepository {
  final adminCollectionRef = FirebaseFireStoreHelper.adminCollectionRef;
  final adminRef = FirebaseFireStoreHelper.adminRef;



  Future<AdminInfo> getAdminDetails({required String gmail}) async {
    var query =
    adminRef.where(Filter(UserInfoDocumentFields.gmail, isEqualTo: gmail));

    var result = await query.get();
    return result.docs.first.data();
  }

  Future<bool> checkIfAdminLoggedIn({required String gmail}) async {
    var query =
    adminRef.where(Filter(UserInfoDocumentFields.gmail, isEqualTo: gmail));

    var result = await query.get();
    return result.docs.isNotEmpty;
  }
}
