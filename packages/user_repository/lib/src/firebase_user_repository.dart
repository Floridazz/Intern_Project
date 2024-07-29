import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:user_repository/src/entities/entities.dart';
import 'package:user_repository/src/models/models.dart';

import 'user_repo.dart';

// class which handle all function like signin, signup user
class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;
  //* reference to "users" collection on database
  final usersCollection = FirebaseFirestore.instance.collection('user');

  //* Emit current user when the authentication state changes.
  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser;
      return user;
    });
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: myUser.email, password: password);
      //* Store the ID that just created when sign up into the instance
      myUser = myUser.copyWith(id: user.user!.uid);
      return myUser;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> getMyUser(String myUserId) async {
    try {
      return usersCollection.doc(myUserId).get().then((onValue) =>
          MyUser.fromEntity(MyUserEntity.fromDocument(onValue.data()!)));
      // must check null data
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> setUserData(MyUser user) async {
    try {
      await usersCollection.doc(user.id).set(user.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
