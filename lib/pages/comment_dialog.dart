import 'package:feedapp/pages/flood_page.dart';
import 'package:flutter/material.dart';

class CommentDialog extends StatefulWidget {
  @override
  _CommentDialogState createState() => _CommentDialogState();
}

class _CommentDialogState extends State<CommentDialog> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Comment'),
      content: TextField(
        controller: _commentController,
        decoration: InputDecoration(labelText: 'Enter your comment'),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // İptal düğmesi
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final String commentText = _commentController.text;
            if (commentText.isNotEmpty) {
              final Comment newComment = Comment(
                username: 'YourUsername', // Burada kullanıcı adınızı ekleyin veya kullanıcıdan alın
                text: commentText,
              );

              Navigator.of(context).pop(newComment); // Yeni yorumu döndür
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}