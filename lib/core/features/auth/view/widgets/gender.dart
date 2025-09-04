import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  final TextEditingController genderController;

  const GenderSelection({super.key, required this.genderController});

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? selectedGender;
  List<String> genderList = ['male', 'female'];

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
        child: DropdownButtonFormField<String>(
          dropdownColor: Colors.black87,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          ),
          value: selectedGender,
          hint: const Text(
            'Select Gender',
            style: TextStyle(color: Colors.white),
          ),
          isExpanded: true,
          items: genderList.map((String gender) {
            return DropdownMenuItem(
              value: gender,
              child: Text(
                gender,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedGender = newValue;
              widget.genderController.text = newValue ?? '';
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select gender';
            }
            return null;
          },
          icon: const Icon(Icons.arrow_drop_down, color: Colors.blueAccent),
        ),
      ),
    );
  }
}
