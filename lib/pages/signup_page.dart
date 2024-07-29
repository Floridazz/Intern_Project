import 'package:flutter/material.dart';
import 'package:helloworld/components/my_textfield.dart';
import 'package:helloworld/components/my_button.dart';
import 'package:helloworld/components/my_function.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

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
                const SizedBox(height: 4),

                // logo
                Image.asset(
                  'lib/images/logo_bk.png',
                  width: 240,
                  height: 240,
                ),

                Text(
                  'ĐĂNG KÝ TÀI KHOẢN BKLIB',
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

                MyTextField(
                  controller: usernameController,
                  hintText: 'Mã số sinh viên',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                MyTextField(
                  controller: usernameController,
                  hintText: 'Mật khẩu',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Nhập lại mật khẩu',
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  onTap: () => directMainMenu(context),
                  buttonText: 'Đăng ký',
                  backgroundColor: Color(0xFF2C88FF),
                  textColor: Colors.white,
                  borderColor: Color(0xFF2C88FF),
                ),

                const SizedBox(height: 10),

                // sign up button
                MyButton(
                  onTap: () => signUserIn(context),
                  buttonText: 'Đã có tài khoản? Đăng nhập tại đây',
                  backgroundColor: Colors.white,
                  textColor: Color(0xFF2C88FF),
                  borderColor: Color(0xFF2C88FF),
                ),

                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
