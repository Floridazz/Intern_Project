import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:helloworld/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:helloworld/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'welcome.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'main_menu.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/loginpage') {
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => BlocProvider<SignInBloc>(
              create: (context) => SignInBloc(
                  myUserRepository:
                      context.read<AuthenticationBloc>().userRepository),
              child: LoginPage(),
            ),
            transitionsBuilder: (_, animation, __, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          );
        } else if (settings.name == '/signuppage') {
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => BlocProvider<SignUpBloc>(
              create: (context) => SignUpBloc(
                  myUserRepository:
                      context.read<AuthenticationBloc>().userRepository),
              child: SignupPage(),
            ),
            transitionsBuilder: (_, animation, __, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          );
        } else if (settings.name == '/mainmenu') {
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => const MainMenu(),
            transitionsBuilder: (_, animation, __, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          );
        }
        return null;
      },
      routes: {
        '/': (context) => const Welcome(),
      },
    );
  }
}
