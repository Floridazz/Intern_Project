import 'package:helloworld/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:helloworld/blocs/authentication_bloc/authentication_bloc.dart';
import './pages/main_menu.dart';
import './pages/authentication_page.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'project',
        //* BlocBuilder: build widget depends on state
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return BlocProvider<SignInBloc>(
              create: (_) => SignInBloc(
                  myUserRepository:
                      context.read<AuthenticationBloc>().userRepository),
              child: const MainMenu(),
            );
          } else {
            return const AuthenticationPage();
          }
        }));
  }
}
