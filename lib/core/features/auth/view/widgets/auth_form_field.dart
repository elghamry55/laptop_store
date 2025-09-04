import 'package:flutter/material.dart';

class AuthFormField extends StatelessWidget {
  const AuthFormField({
    super.key,
    required this.validator,
    required this.controller,
    required this.hintText,
    required this.label,
    required this.prefixIcon,
    required this.obscureText,
    required this.keyboardType,
  });

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String hintText;
  final String label;
  final IconData prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: keyboardType,
          validator: validator,
          obscureText: obscureText,
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            labelText: label,
            labelStyle: const TextStyle(color: Colors.white),
            prefixIcon: Icon(prefixIcon, color: Colors.blueAccent),
            suffixIcon: IconButton(
              onPressed: () => controller?.clear(),
              icon: const Icon(Icons.cancel, color: Colors.redAccent),
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          ),
        ),
      ),
    );
  }
}
