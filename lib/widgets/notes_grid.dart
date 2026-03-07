import 'package:flutter/material.dart';
import '../models/note.dart';
import 'note_card.dart';

class NotesGrid extends StatelessWidget {
  final List<Note> notes;
  final Function(int) onNoteTap;
  final Function(int) onDelete; 

  const NotesGrid({
    required this.notes,
    required this.onNoteTap,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: notes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.8, 
      ),
      itemBuilder: (_, index) {
        return NoteCard(
          note: notes[index],
          onTap: () => onNoteTap(index),
          onDelete:()=>onDelete(index),
        );
      },
    );
  }
}