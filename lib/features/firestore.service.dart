import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_app/model/note.dart';

class FireStoreServices {
  Future<void> addNote(String title, String content) async {
    // Create a new note object
    Note newNote = Note(
      title: title,
      content: content,
      date: DateTime.now().toString(),
      id: "", // Placeholder for the ID
    );

    // Add the note to Firestore
    DocumentReference docRef = await FirebaseFirestore.instance
        .collection('notes')
        .add(newNote.toMap());

    newNote.id = docRef.id;

    await docRef.update({'id': newNote.id});
  }

  Future<void> updateNote(String id, String title, String content) async {
    // Create a new note object with the updated content
    Note updatedNote = Note(
      title: title,
      content: content,
      date: DateTime.now().toString(),
      id: id,
    );

    // Update the note in Firestore
    await FirebaseFirestore.instance
        .collection('notes')
        .doc(id)
        .update(updatedNote.toMap());
  }
}
