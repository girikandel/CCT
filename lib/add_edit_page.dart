import 'package:flutter/material.dart';
import 'package:message_app/custom_field_widget.dart';
import 'package:message_app/note_model.dart';

class AddEditPage extends StatefulWidget {
  const AddEditPage({super.key});

  @override
  State<AddEditPage> createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 10),
              CustomFieldWidget(
                label: 'Title',
                controller: titleController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Title is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomFieldWidget(
                label: 'Description',
                maxLines: 5,
                controller: descriptionController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Title is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      notes.add(
                        NoteModel(
                          id: notes.length + 1,
                          title: titleController.text,
                          description: descriptionController.text,
                          date: DateTime.now(),
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
