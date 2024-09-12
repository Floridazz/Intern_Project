import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/firebase_options.dart';

import 'package:helloworld/app.dart';
import 'package:helloworld/simple_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]); // Prefer portrait
  //*
  runApp(MyApp(FirebaseUserRepository()));

  /// TEST ACCOUNT:
  /// test1@gmail.com
  /// testtest1
  /// name: test1
  /// 
  /// ADMIN ACCOUNT:
  /// admin@gmail.com
  /// adminPassword
  /// name: admin
}
