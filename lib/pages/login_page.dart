import 'package:flutter/material.dart';
import 'package:helloworld/components/my_textfield.dart';
import 'package:helloworld/components/my_button.dart';
import 'package:helloworld/components/my_function.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 12),

                // logo
                Image.asset(
                  'lib/images/logo_bk.png',
                  width: 240,
                  height: 240,
                ),

                Text(
                  'ĐĂNG NHẬP VÀO BKLIB',
                  style: TextStyle(
                    color: Color(0xFF2C88FF),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 24),

                // username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Tên đăng nhập',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Mật khẩu',
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  onTap: () => directMainMenu(context),
                  buttonText: 'Đăng nhập',
                  backgroundColor: Color(0xFF2C88FF),
                  textColor: Colors.white,
                  borderColor: Color(0xFF2C88FF),
                ),

                const SizedBox(height: 10),

                // sign up button
                MyButton(
                  onTap: () => signUserUp(context),
                  buttonText: 'Chưa có tài khoản? Đăng ký tại đây',
                  backgroundColor: Colors.white,
                  textColor: Color(0xFF2C88FF),
                  borderColor: Color(0xFF2C88FF),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
