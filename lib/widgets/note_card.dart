import 'package:flutter/material.dart';
import '../models/note.dart';
import '../core/constants.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const NoteCard({
    required this.note,
    required this.onTap,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: primary, width: 2),
          boxShadow: [
            BoxShadow(
              color: primary.withOpacity(0.4),
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, 
            children: [
              Text(
                note.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: gray900,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                note.content,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: gray700),
              ),
              IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: onDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}