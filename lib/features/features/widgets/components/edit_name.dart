import 'package:agrosell/utils/services/firebase.service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class EditNamePage extends StatefulWidget {
  final String id;
  final String name;

  const EditNamePage({
    @PathParam('id') required this.id,
    @PathParam('name') required this.name,
  });

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  final TextEditingController _nameController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    debugPrint('widget: ${widget}');
    // final arguments = EditNamePageRouteParams.of(context).arguments;
    _nameController.text = widget.name;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Name'),
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
                    await updatePeople(
                            widget.id as String, _nameController.text)
                        .then((_) {
                      Navigator.pop(context);
                    });
                  },
                  child: const Text('Update'))
            ],
          ),
        ));
  }
}
