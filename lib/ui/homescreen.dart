import 'package:crud_app/components/fancy.dart';
import 'package:crud_app/features/firestore.service.dart';
import 'package:crud_app/model/note.dart';
import 'package:crud_app/routes/appRoutes.dart';
import 'package:fancy_element/fancy_element.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FireStoreServices _fireStore = FireStoreServices();
 
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CRUDify'),
          automaticallyImplyLeading: false,
        ),
        body:Column(
            
            children: [
              StreamBuilder(
                stream: _fireStore.getNotes(),
                builder: (context, AsyncSnapshot<List<Note>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return const Text('Error');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No notes available');
                  } else {
                    final notes = snapshot.data!;
                    return Column(
                      children: notes.map((note) {
                        return ListTile(
                        
                          title: Text(
                            note.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                            ),
                          subtitle: Text(note.content),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () async {
                              await _fireStore.deleteNote(note.id);
                            },
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, AppRoute.editNoteRoute,
                              arguments: note.id);
                          },
                        );
                      }).toList(), 
                    );
                  }
                },
              ),
            ],
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
      ),
    );
  }
}
