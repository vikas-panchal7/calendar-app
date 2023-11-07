import 'package:equatable/equatable.dart';

class AdminInfo extends Equatable{
  final String id;
  final String gmail;

  const AdminInfo({required this.id, required this.gmail});
  @override
  List<Object?> get props =>
      [id,  gmail];

  AdminInfo copyWith({
    String? id,

    String? gmail

  }) {
    return AdminInfo(
      id: id ?? this.id,

      gmail: gmail ?? this.gmail

    );
  }
}



abstract interface class AdminInfoDocumentFields {
  static const id = 'id';

  static const gmail = 'gmail';

}
