import 'package:flutter/material.dart';

class ToDoFormWidget extends StatelessWidget {
  late String title = '';
  late String description = '';
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedToDo;

  ToDoFormWidget(
      {Key? key,
      this.title = '',
      this.description = '',
      required this.onChangedTitle,
      required this.onChangedDescription,
      required this.onSavedToDo})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            const SizedBox(height: 20),
            buildDescription(),
            const SizedBox(height: 50),
            buildButton(),
          ],
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title!.isEmpty) {
            return "Title cannot be empty";
          }
          return null;
        },
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: "Title",
        ),
      );

  Widget buildDescription() => TextFormField(
        maxLines: 3,
        initialValue: description,
        onChanged: onChangedDescription,
        validator: (description) {
          if (description!.isEmpty) {
            return "Description cannot be empty";
          }
          return null;
        },
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: "Description",
        ),
      );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onSavedToDo,
          child: const Text(
            "Save",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.deepOrange[400]),
          ),
        ),
      );
}
