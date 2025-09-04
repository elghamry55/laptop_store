import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laptop_store/core/features/auth/cubit/auth_cubit.dart';
import 'package:laptop_store/core/features/auth/view/screen/register.dart';
import 'package:laptop_store/core/features/auth/view/widgets/auth_form_field.dart';
import 'package:laptop_store/core/features/auth/view/widgets/validator.dart';
import 'package:laptop_store/pages.dart';

class AuthHome extends StatelessWidget {
  AuthHome({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff334155), Color(0xff1E293B)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Card(
              color: Colors.transparent,
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: EdgeInsets.all(width * 0.04),
                width: width * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff334155), width: 3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.laptop_mac,
                      size: height * 0.18,
                      color: Colors.white,
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      "Laptop Store",
                      style: TextStyle(
                        fontSize: width * 0.07,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: height * 0.04),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          AuthFormField(
                            controller: email,
                            hintText: 'Enter your email',
                            label: 'Email',
                            prefixIcon: Icons.email,
                            obscureText: false,
                            validator: (value) =>
                                MyValidators.emailValidator(value),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: height * 0.02),
                          AuthFormField(
                            controller: password,
                            hintText: 'Enter your password',
                            label: 'Password',
                            prefixIcon: Icons.lock,
                            obscureText: true,
                            validator: (value) =>
                                MyValidators.passwordValidator(value),
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: height * 0.03),

                          BlocConsumer<AuthCubit, AuthState>(
                            listener: (context, state) {
                              if (state is AuthLoginSuccessState) {
                                final isSuccess =
                                    state.data['status'] == 'success';
                                final message = isSuccess
                                    ? 'Login Success'
                                    : state.data['message'];
                                final bgColor =
                                isSuccess ? Colors.green : Colors.red;

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: width * 0.05,
                                      vertical: height * 0.02,
                                    ),
                                    padding: EdgeInsets.all(width * 0.04),
                                    backgroundColor: bgColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    content: Row(
                                      children: [
                                        Icon(
                                          isSuccess
                                              ? Icons.check_circle
                                              : Icons.error,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: width * 0.03),
                                        Expanded(
                                          child: Text(
                                            message,
                                            style: TextStyle(
                                              fontSize: width * 0.045,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );

                                if (isSuccess) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Pages(),
                                    ),
                                  );
                                }
                              }
                            },
                            builder: (context, state) {
                              return SizedBox(
                                width: double.infinity,
                                height: height * 0.07,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      AuthCubit.get(context).loginCubit(
                                        email: email.text,
                                        password: password.text,
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    shadowColor:
                                    Colors.black.withOpacity(0.3),
                                    elevation: 6,
                                  ),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: width * 0.05,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.1,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),

                          SizedBox(height: height * 0.02),


                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Register(),
                                ),
                              );
                            },
                            child: Text(
                              "Don't have an account? Sign up",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
