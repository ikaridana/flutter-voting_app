import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

final dummySnapshot = [
  {"Name" : "Filip", "votes": 15},
  {"Name" : "Filip", "votes": 15},
  {"Name" : "Filip", "votes": 15},
  {"Name" : "Filip", "votes": 15},
  {"Name" : "Filip", "votes": 15}
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Voting App",
      home: VotingApp(),
    );
  }
}

class VotingApp extends StatefulWidget {
  @override
  _VotingAppState createState () => _VotingAppState();
}

class _VotingAppState extends State<VotingApp> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        title: Text('Let\'s Vote'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {

    return _buildList(context, dummySnapshot);
  }

  Widget _buildList(BuildContext context, List<Map> snapshot){
    return ListView(
      padding: const EdgeInsets.only(top: 10.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Map data){
    final record = Record.fromMap(data);
    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.name),
          trailing: Text(record.votes.toString()),
          onTap: () => print(record),
        ),
      ),
    );
  }
}

class Record {
  final String name;
  final int votes;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
    : assert(map['name'] != null),
      assert(map['votes'] != null),
      name = map['name'],
      votes = map['votes'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
    : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$votes>";
}