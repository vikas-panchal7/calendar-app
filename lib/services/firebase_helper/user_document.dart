import 'package:equatable/equatable.dart';

class UserInfo extends Equatable {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String userName;
  final String gmail;
  final LoginType loginType;

  const UserInfo({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userName,
    required this.gmail,
    required this.loginType,
  });

  @override
  List<Object?> get props =>
      [id, createdAt, updatedAt, userName, gmail, loginType];

  UserInfo copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userName,
    String? gmail,
    LoginType? loginType,
  }) {
    return UserInfo(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userName: userName ?? this.userName,
      gmail: gmail ?? this.gmail,
      loginType: loginType ?? this.loginType,
    );
  }
}

abstract interface class UserInfoDocumentFields {
  static const id = "id";
  static const createdAt = "createdAt";
  static const updatedAt = "updatedAt";
  static const userName = "userName";
  static const gmail = "gmail";
  static const loginType = "loginType";
}

enum LoginType { googleLogin }
