import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

class MyUser extends Equatable {
  final String id;
  final String email;
  final String name;
  final String studentId;
  final String? picture;

  const MyUser(
      {required this.id,
      required this.email,
      required this.name,
      required this.studentId,
      this.picture});

  static const empty = MyUser(id: '', email: '', name: '', studentId: '', picture: '');

  //* Method to modify MyUser object since all the field are "final" in order to use Equatable
  MyUser copyWith({String? id, String? email, String? name, String? studentId, String? picture}) {
    return MyUser(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        studentId: studentId ?? this.studentId,
        picture: picture ?? this.picture);
  }

  //* MyUser => MyUserEntity
  MyUserEntity toEntity() {
    return MyUserEntity(id: id, email: email, name: name, studentId: studentId, picture: picture);
  }

  //* MyUserEntity => MyUser
  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
        id: entity.id,
        email: entity.email,
        name: entity.name,
        studentId: entity.studentId,
        picture: entity.picture);
  }

  //* Getter to check if MyUser object is empty or not
  bool get isEmpty => this == MyUser.empty;
  bool get isNotEmpty => this != MyUser.empty;

  @override
  List<Object?> get props => [id, email, name, studentId, picture];
}
