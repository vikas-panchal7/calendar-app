import 'package:equatable/equatable.dart';

class UserDataInfo extends Equatable {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String userName;
  final String gmail;
  final LoginType loginType;
  final String imageUrl;
  final String phoneNo;
  final String city;
  final String userProfession;

  const UserDataInfo( {
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userName,
    required this.gmail,
    required this.loginType,
    required this.imageUrl,
    required this.phoneNo,
    required this.city,
    required this.userProfession,
  });

  @override
  List<Object?> get props =>
      [id, createdAt, updatedAt, userName, gmail, loginType,imageUrl,phoneNo,city,userProfession
      ];

  UserDataInfo copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userName,
    String? gmail,
    String? imageUrl,
    LoginType? loginType,
    String? phoneNo,
    String? city,
    String? userProfession,
  }) {
    return UserDataInfo(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userName: userName ?? this.userName,
      gmail: gmail ?? this.gmail,
      loginType: loginType ?? this.loginType,
      imageUrl: imageUrl??this.imageUrl,
        phoneNo: phoneNo??this.phoneNo, city: city??this.city, userProfession: ''
    );
  }
}

abstract interface class UserInfoDocumentFields {
  static const id = 'id';
  static const createdAt = 'createdAt';
  static const updatedAt = 'updatedAt';
  static const userName = 'userName';
  static const gmail = 'gmail';
  static const loginType = 'loginType';
  static const imageUrl = 'imageUrl';
  static const phoneNo  = 'phoneNo';
  static const city  = 'city';
  static const userProfession  = 'userProfession';
}

enum LoginType { googleLogin }
