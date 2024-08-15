import 'package:crud_app/routes/appRoutes.dart';
import 'package:crud_app/ui/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const crud());
}

class crud extends StatelessWidget {
  const crud({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRoute.DyanmicRoute,  
      initialRoute: AppRoute.homeRoute,
       home: const Scaffold(
        body: Center(
        
        ),
        )
    );
  }
}
