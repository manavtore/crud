import 'package:crud_app/ui/addNote.dart';
import 'package:crud_app/ui/homescreen.dart';
import 'package:flutter/material.dart';

import '../ui/editScreen.dart';

class AppRoute {
  static const String homeRoute = '/home';
  static const String addNoteRoute = '/addNote';
  static const String editNoteRoute = '/editNote';


  static Route<dynamic> DyanmicRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case addNoteRoute:
        return MaterialPageRoute(builder: (_) => const AddNote());
      case editNoteRoute:
        final id = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => EditNote(noteId: id ?? ''));
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }
}
