import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;

class ProfileUpdate extends StatefulWidget {
  late final String documentId;

   ProfileUpdate({super.key});

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  late Future<DocumentSnapshot> _futureDocument;
  late String _message = '';
  @override
  void initState() {
    super.initState();
    _loadMessage();
  }

  Future<void> _loadMessage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String message = prefs.getString('UID') ?? '';
    setState(() {
      _message = message;
    });
    _futureDocument = _getDocument();
  }

  Future<DocumentSnapshot> _getDocument() async {
    print(_message);

    return await FirebaseFirestore.instance
        .collection('users')
        .doc(_message)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SizedBox(
      height: 2000,
      child: FutureBuilder<DocumentSnapshot>(
        future: _futureDocument,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            DocumentSnapshot<Object?>? documentSnapshot = snapshot.data;
            if (documentSnapshot!.exists) {
              Map<String, dynamic>? data =
                  documentSnapshot.data() as Map<String, dynamic>?;
              return Scaffold(
                appBar: AppBar(
                  title: const Text("Profile"),
                ),
                body: Container(
                  child: Column(
                    children: [
                      Container(
                        child: Image.network(data!['ImageURL']),
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: "First Name"),
                        controller:
                            TextEditingController(text: '${data['FirstName']}'),
                        // decoration: InputDecoration(),
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: "Last Name"),
                        controller:
                            TextEditingController(text: '${data['LastName']}'),
                        // decoration: InputDecoration(),
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: "Phone Number"),
                        controller: TextEditingController(
                            text: '${data['PhoneNumber']}'),
                        // decoration: InputDecoration(),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text('Document does not exist'),
              );
            }
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ));
  }
}
