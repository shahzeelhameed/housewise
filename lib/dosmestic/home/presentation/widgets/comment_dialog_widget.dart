import 'package:flutter/material.dart';

class CommentDialogWidget extends StatelessWidget {
  CommentDialogWidget({super.key, required this.title});

  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Form(
        key: formKey,
        child: TextFormField(
          controller: controller,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: "Enter your review",
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Comment cannot be empty';
            }
            return null;
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text("Cancel"),
          onPressed: () => Navigator.of(context).pop(null),
        ),
        ElevatedButton(
          child: Text("Submit"),
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              Navigator.of(context).pop(controller.text.trim());
            }
          },
        ),
      ],
    );
  }
}
