import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUDify'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to CRUDify!'),
        
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 30, 20),
        
        child: FloatingActionButton(
          highlightElevation: 2.0,
          
          onPressed: () {
            Navigator.pushNamed(context, '/addNote');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
