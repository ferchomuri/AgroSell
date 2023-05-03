import 'package:agrosell/utils/router.gr.dart';
import 'package:agrosell/utils/services/firebase.service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ListFruit extends StatefulWidget {
  const ListFruit({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ListFruit> createState() => _ListFruitState();
}

class _ListFruitState extends State<ListFruit> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: FutureBuilder(
          future: getPeople(),
          builder: (context, snapshot) => snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      onDismissed: (direction) async {
                        final id = snapshot.data?[index]['id'] as String;
                        await deletePeople(id);
                      },
                      confirmDismiss: (direction) async {
                        var result = false;

                        result = (await showDialog<bool>(
                          // add <bool> here to explicitly specify the return type
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Confirm'),
                              content: Text(
                                'Are you sure you want to delete ${snapshot.data?[index]['name']}?',
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    return Navigator.of(context).pop(true);
                                  },
                                  child: const Text('Yes'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    return Navigator.of(context).pop(false);
                                  },
                                  child: const Text('No'),
                                ),
                              ],
                            );
                          },
                        ))!;

                        return result;
                      },
                      background: Container(
                        color: const Color.fromARGB(255, 243, 82, 71),
                        child: const Icon(Icons.delete),
                      ),
                      direction: DismissDirection.endToStart,
                      key: Key((snapshot.data?[index]['id'] ?? '').toString()),
                      child: ListTile(
                        title: Text(
                          (snapshot.data?[index]['name'] ?? "").toString(),
                        ),
                        onTap: () async {
                          debugPrint('onTap');
                          debugPrint(snapshot.data?[index]['id'].toString());
                          debugPrint(snapshot.data?[index]['name'].toString());
                          await context.router.push(
                            EditNamePageRoute(
                              id: snapshot.data?[index]['id'] as String,
                              name: snapshot.data?[index]['name'] as String,
                            ),
                          );
                          // await AppRouter.of(context).pushNamed(
                          //   context,
                          //   '/editName',
                          //   arguments: {
                          //     'id': snapshot.data?[index]['id'],
                          //     'name': snapshot.data?[index]['name'],
                          //   },
                          // );
                          setState(() {});
                        },
                      ),
                    );
                  },
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // await Navigator.pushNamed(context, '/addName');
          await context.router.push(
            AddNamePageRoute(),
          );
          setState(() {});
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
