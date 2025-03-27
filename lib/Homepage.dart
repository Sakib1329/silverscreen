import 'package:flutter/material.dart';
class Homepage extends StatelessWidget {

  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Center(child: Text('Homepage',style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}