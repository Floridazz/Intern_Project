import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:helloworld/components/my_textfield.dart';
import 'package:helloworld/components/form_textfield.dart';
import 'package:helloworld/components/my_button.dart';
import 'package:helloworld/components/my_function.dart';

import '../blocs/sign_in_bloc/sign_in_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$');
  String? _errorMsg;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool signInRequired = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            setState(() {
              signInRequired = false;
            });
          } else if (state is SignInProcess) {
            setState(() {
              signInRequired = true;
            });
          } else if (state is SignInFailure) {
            setState(() {
              signInRequired = false;
              _errorMsg = 'Invalid email or password';
            });
          }
        },
        child: Scaffold(
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

                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            // username textfield
                            FormTextfield(
                              controller: emailController,
                              hintText: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              obscureText: false,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Nhập email';
                                } else if (!emailRegExp.hasMatch(val)) {
                                  return 'Nhập đúng định dạng email';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 10),

                            // password textfield
                            FormTextfield(
                              controller: passwordController,
                              hintText: 'Mật khẩu',
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                            ),

                            const SizedBox(height: 25),

                            // sign in button
                            !signInRequired
                                ? MyButton(
                                    //* API call
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<SignInBloc>().add(
                                            SignInRequired(emailController.text,
                                                passwordController.text));
                                      }
                                    },
                                    buttonText: 'Đăng nhập',
                                    backgroundColor: Color(0xFF2C88FF),
                                    textColor: Colors.white,
                                    borderColor: Color(0xFF2C88FF),
                                  )
                                : const CircularProgressIndicator(),

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
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
