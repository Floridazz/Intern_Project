// lib/components/my_function.dart
import 'package:flutter/material.dart';

void signUserUp(BuildContext context) {
  Navigator.pushNamed(context, '/signuppage');
}

void signUserIn(BuildContext context) {
  Navigator.pop(context);
}

void directMainMenu(BuildContext context) {
  Navigator.pushNamed(context, '/mainmenu');
}
