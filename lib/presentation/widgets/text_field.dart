import 'package:flutter/material.dart';

class CustTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool obscureText;

  const CustTextField({ 
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
         decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          filled: true, 
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.orange)
          ),
        ),
      ),
    );
  }
}
