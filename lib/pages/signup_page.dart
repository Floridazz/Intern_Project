import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:helloworld/components/form_textfield.dart';
import 'package:helloworld/components/my_textfield.dart';
import 'package:helloworld/components/my_button.dart';
import 'package:helloworld/components/my_function.dart';
import 'package:user_repository/user_repository.dart';

import '../blocs/sign_up_bloc/sign_up_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordRepeatController = TextEditingController();
  final nameController = TextEditingController();
  final studentIdController = TextEditingController();
  RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$');
  bool signUpRequired = false;
  String? _errorMsg;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          // Handle different states here
          if (state is SignUpSuccess) {
            setState(() {
              signUpRequired = false;
            });
          } else if (state is SignUpProcess) {
            setState(() {
              signUpRequired = true;
            });
          } else if (state is SignUpFailure) {
            setState(() {
              signUpRequired = false;
              _errorMsg = 'Error';
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

                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          // username textfield
                          FormTextfield(
                            controller: usernameController,
                            hintText: 'Email',
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
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

                          FormTextfield(
                            controller: nameController,
                            hintText: 'Tên',
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Nhập tên';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 10),

                          FormTextfield(
                            controller: studentIdController,
                            hintText: 'Mã số sinh viên',
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Nhập mã số sinh viên';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 10),

                          FormTextfield(
                            controller: passwordController,
                            hintText: 'Mật khẩu',
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Nhập mật khẩu';
                              }
                              if (val.length < 6) {
                                return 'Mật khẩu phải có ít nhất 6 ký tự';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 10),

                          // password textfield
                          FormTextfield(
                            controller: passwordRepeatController,
                            hintText: 'Nhập lại mật khẩu',
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Nhập lại mật khẩu';
                              } else if (val != passwordController.text) {
                                return 'Mật khẩu không khớp';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 25),

                          // sign in button
                          !signUpRequired
                              ? MyButton(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      MyUser myUser = MyUser.empty;
                                      myUser = myUser.copyWith(
                                          email: usernameController.text,
                                          studentId: studentIdController.text,
                                          name: nameController.text);
                                      //* API call
                                      context.read<SignUpBloc>().add(
                                          SignUpRequired(
                                              myUser, passwordController.text));
                                    }
                                  },
                                  buttonText: 'Đăng ký',
                                  backgroundColor: Color(0xFF2C88FF),
                                  textColor: Colors.white,
                                  borderColor: Color(0xFF2C88FF),
                                )
                              : const CircularProgressIndicator(),

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
                  )
                ]))),
          ),
        ));
  }
}
