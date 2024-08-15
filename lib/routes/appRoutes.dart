import 'package:crud_app/ui/addNote.dart';
import 'package:crud_app/ui/homescreen.dart';

class AppRoute{
  static const String homeRoute = '/home';
  static const String addNoteRoute = '/addNote'; 

  static final route = {
    homeRoute : (context) => const homeScreen(),
    addNoteRoute :(context) => const AddNote(),
  };
  
}