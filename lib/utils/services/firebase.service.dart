import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestoreDB = FirebaseFirestore.instance;

Future<List<dynamic>> getPeople() async {
  final verduras = <dynamic>[];

  final CollectionReference peopleCollection =
      firestoreDB.collection('verduras');

  final peopleSnapshot = await peopleCollection.get();

  for (final doc in peopleSnapshot.docs) {
    final data = doc.data()! as Map<String, dynamic>;
    final person = {
      'id': doc.id,
      'name': data['name'],
    };
    verduras.add(person);
  }

  return verduras;
}

Future<void> addPeople(String name) async {
  await firestoreDB.collection('verduras').add({
    'name': name,
  });
}

Future<void> updatePeople(String id, String name) async {
  await firestoreDB.collection('verduras').doc(id).set({'name': name});
}

Future<void> deletePeople(String id) async {
  await firestoreDB.collection('verduras').doc(id).delete();
}
