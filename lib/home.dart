import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final dynamic email;
  Home({super.key, required this.email});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FarmerEats",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Text("Welcome Home ${widget.email}"), // Use widget.email here
      ),
    );
  }
}
