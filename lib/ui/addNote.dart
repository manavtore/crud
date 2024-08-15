import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_app/features/firestore.service.dart';
import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final FireStoreServices _fireStore = FireStoreServices();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _clearInput() {
    _titleController.clear();
    _contentController.clear();
  }

  Future<void> _addNote() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _fireStore.addNote(
          _titleController.text,
          _contentController.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Note added successfully!')),
        );
        _clearInput();
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add note: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: 'Content'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some content';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addNote,
                child: const Text('Add Note'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
