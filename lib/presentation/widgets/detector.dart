import 'package:flutter/material.dart';

class CustDetector extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  
  const CustDetector({
    super.key, 
    required this.child, 
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, 
      child: child
    );
  }
}
