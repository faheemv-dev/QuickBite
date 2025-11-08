import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      appBar: AppBar(backgroundColor: Colors.orange,
      leading:CircleAvatar(
        backgroundImage: AssetImage('assets/profile.jpg'),
      ),),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text("HeY there!", style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 5),
                  Text(
                    "QuickBite",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    
  }
}
