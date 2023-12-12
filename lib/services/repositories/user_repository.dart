import 'package:calendar_app/constants/app_constant.dart';
import 'package:calendar_app/services/firebase_helper/firebase_firestore_helper.dart';
import 'package:calendar_app/services/firebase_helper/user_document.dart';
import 'package:calendar_app/utils/pagination/pagination_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final userCollectionRef = FirebaseFireStoreHelper.userCollectionRef;
  final userRef = FirebaseFireStoreHelper.userRef;

  Future<bool> createUser({
    required String userName,
    required String gmail,
    required String imageUrl,
    required LoginType loginType,
    required String id,
    required String phoneNo,
    required String city,
    required String userProfession,
  }) async {
    var data = {
      UserInfoDocumentFields.gmail: gmail,
      UserInfoDocumentFields.userName: userName,
      UserInfoDocumentFields.createdAt: DateTime.timestamp(),
      UserInfoDocumentFields.updatedAt: DateTime.timestamp(),
      UserInfoDocumentFields.loginType: loginType.name,
      UserInfoDocumentFields.imageUrl:imageUrl,
      UserInfoDocumentFields.phoneNo:phoneNo,
      UserInfoDocumentFields.city:city,
      UserInfoDocumentFields.userProfession:userProfession,

    };

    await userCollectionRef
        .doc(id)
        .set(data)
        .onError((error, stackTrace) => false);

    return true;
  }
  String getUserDetailId() => userCollectionRef.doc().id;
  Future<UserDataInfo> getUserDetails({required String gmail}) async {
    var query =
        userRef.where(Filter(UserInfoDocumentFields.gmail, isEqualTo: gmail));

    var result = await query.get();
    return result.docs.first.data();
  }

  Future<PaginatedList<UserDataInfo>> getUserList({required DocumentSnapshot? lastDocument}) async {
    var query = userRef.orderBy(UserInfoDocumentFields.createdAt, descending: true);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }
    query = query.limit(AppConst.paginationLength);

    var result = await query.get();
    List<UserDataInfo> toReturn = [];

    if (result.docs.isEmpty) {
      return PaginatedList.empty();
    }

    for (var element in result.docs) {
      toReturn.add(element.data());
    }
    return PaginatedList(
      data: toReturn,
      isAvailableMore: toReturn.length == AppConst.paginationLength,
      lastDocument: result.docs.last,
    );
  }

  Future<bool> checkIfUserLoggedIn({required String gmail}) async {
    var query =
        userRef.where(Filter(UserInfoDocumentFields.gmail, isEqualTo: gmail));

    var result = await query.get();
    return result.docs.isNotEmpty;
  }
}
