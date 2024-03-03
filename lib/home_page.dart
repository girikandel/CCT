

import 'package:flutter/material.dart';
import 'package:message_app/add_edit_page.dart';
import 'package:message_app/note_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes App"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: notes.isEmpty
            ? const Center(
                child: Text("No notes found!!!"),
              )
            : ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, ind) {
                  return Card(
                    child: ListTile(
                      title: Text(notes[ind].title ?? ""),
                      subtitle: Text(notes[ind].description ?? ''),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            notes.removeAt(ind);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AddEditPage()))
              .then((value) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
