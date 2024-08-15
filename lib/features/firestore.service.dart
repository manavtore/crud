import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_app/model/note.dart';

class FireStoreServices {
  Future<void> addNote(String title, String content) async {
    Note newNote = Note(
      title: title,
      content: content,
      date: DateTime.now().toString(),
      id: "", 
    );

    DocumentReference docRef = await FirebaseFirestore.instance
        .collection('notes')
        .add(newNote.toMap());

    newNote.id = docRef.id;

    await docRef.update({'id': newNote.id});
  }

  Future<void> updateNote(String id, String title, String content) async {
    Note updatedNote = Note(
      title: title,
      content: content,
      date: DateTime.now().toString(),
      id: id,
    );

    await FirebaseFirestore.instance
        .collection('notes')
        .doc(id)
        .update(updatedNote.toMap());
  }

  Future<void> deleteNote(String id) async {
    await FirebaseFirestore.instance.collection('notes').doc(id).delete();
  }

  Stream<List<Note>> getNotes() {
    return FirebaseFirestore.instance
        .collection('notes')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Note.fromMap(doc.data() as Map<String, dynamic>))
            .toList());
  }

  Future<DocumentSnapshot> getNoteById(String id) {
    return FirebaseFirestore.instance.collection('notes').doc(id).get();
  }
}
