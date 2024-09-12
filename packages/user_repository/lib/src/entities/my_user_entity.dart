// handle the transformation of the User class

import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String studentId;
  final String? picture;

  const MyUserEntity(
      {required this.id,
      required this.email,
      required this.name,
      required this.studentId,
      this.picture});

  Map<String, Object?> toDocument() {
    return {'id': id, 'email': email, 'name': name, 'studentId': studentId, 'picture': picture};
  }

  static MyUserEntity fromDocument(Map<String, Object?> doc) {
    return MyUserEntity(
        id: doc['id'] as String,
        email: doc['email'] as String,
        name: doc['name'] as String,
        studentId: doc['studentId'] as String,
        picture: doc['picture'] as String);
  }

  @override
  List<Object?> get props => [id, email, name, studentId, picture];

  @override
  String toString() {
    return '''UserEntity: {
    id: $id
    email: $email
    name: $name
    studentId: $studentId
    picture: $picture
    }''';
  }
}
