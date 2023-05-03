import 'package:agrosell/utils/services/firebase.service.dart';
import 'package:flutter/material.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  final TextEditingController _nameController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Name'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter a name',
                  // border: OutlineInputBorder(),
                  // labelText: 'Name',
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await addPeople(_nameController.text).then((_) {
                      Navigator.pop(context);
                    });
                  },
                  child: const Text('Add Name'))
            ],
          ),
        ));
  }
}
