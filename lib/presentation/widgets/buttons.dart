import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  
  const Buttons({super.key,
  required  this.text,required this.onPressed});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          padding: const EdgeInsets.symmetric(vertical: 13),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
        ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}