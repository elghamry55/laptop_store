import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laptop_store/core/features/auth/cubit/auth_cubit.dart';
import 'package:laptop_store/core/features/auth/view/screen/auth_home.dart';
import 'package:laptop_store/core/features/auth/view/widgets/auth_form_field.dart';
import 'package:laptop_store/core/features/auth/view/widgets/gender.dart';
import 'package:laptop_store/core/features/auth/view/widgets/validator.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController nameCon = TextEditingController();
  final TextEditingController passCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController genderCon = TextEditingController();
  final TextEditingController phoneCon = TextEditingController();
  final TextEditingController iDCon = TextEditingController();

  void showCustomSnackBar(BuildContext context,
      {required String message, required bool isSuccess}) {
    final width = MediaQuery.of(context).size.width;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: 12,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        backgroundColor: isSuccess ? Colors.green : Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        content: Row(
          children: [
            Icon(
              isSuccess ? Icons.check_circle : Icons.error,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthRegisterSuccessState) {
          if (state.data['status'] == 'success') {
            showCustomSnackBar(
              context,
              message: state.data['message'],
              isSuccess: true,
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AuthHome()),
            );
          } else if (state.data['status'] == 'error') {
            showCustomSnackBar(
              context,
              message: state.data['message'],
              isSuccess: false,
            );
          }
        }
      },
      builder: (context, state) {
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
                      border:
                      Border.all(color: const Color(0xff334155), width: 3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Register",
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
                                validator: MyValidators.displayNamevalidator,
                                controller: nameCon,
                                hintText: "Enter your name",
                                label: "Name",
                                prefixIcon: Icons.person,
                                obscureText: false,
                                keyboardType: TextInputType.text,
                              ),
                              AuthFormField(
                                validator: MyValidators.emailValidator,
                                controller: emailCon,
                                hintText: "Enter your email",
                                label: "Email",
                                prefixIcon: Icons.email,
                                obscureText: false,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              AuthFormField(
                                validator: MyValidators.passwordValidator,
                                controller: passCon,
                                hintText: "Enter your password",
                                label: "Password",
                                prefixIcon: Icons.password,
                                obscureText: true,
                                keyboardType: TextInputType.text,
                              ),
                              AuthFormField(
                                validator: MyValidators.phoneValidator,
                                controller: phoneCon,
                                hintText: "Enter your phone",
                                label: "Phone",
                                prefixIcon: Icons.phone,
                                obscureText: false,
                                keyboardType: TextInputType.phone,
                              ),
                              AuthFormField(
                                validator: MyValidators.nationalIdValidator,
                                controller: iDCon,
                                hintText: "Enter your ID",
                                label: "National ID",
                                prefixIcon: Icons.credit_card,
                                obscureText: false,
                                keyboardType: TextInputType.number,
                              ),
                              GenderSelection(genderController: genderCon),
                              SizedBox(height: height * 0.03),

                              SizedBox(
                                width: double.infinity,
                                height: 55,
                                child: ElevatedButton(
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
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      AuthCubit.get(context).registerCubit(
                                        email: emailCon.text.trim(),
                                        password: passCon.text.trim(),
                                        name: nameCon.text.trim(),
                                        phone: phoneCon.text.trim(),
                                        gender: genderCon.text
                                            .trim()
                                            .toLowerCase(),
                                        nationalId: iDCon.text.trim(),
                                      );
                                    } else {
                                      showCustomSnackBar(
                                        context,
                                        message: "Please fix the errors above",
                                        isSuccess: false,
                                      );
                                    }
                                  },
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
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
      },
    );
  }
}
