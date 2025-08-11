import 'package:flutter/material.dart';
import 'package:machine_test/constants/colors.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.label,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = false;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _isObscured,
      onChanged: widget.onChanged,
      style: const TextStyle(
        color: Color.fromARGB(255, 0, 0, 0), // White text when typing
      ),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(color: Color.fromARGB(179, 11, 31, 254)),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(179, 0, 0, 0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        suffixIcon:
            widget.obscureText
                ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
                : null,
      ),
    );
  }
}
