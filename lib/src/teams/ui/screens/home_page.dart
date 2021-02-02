import 'dart:math';

import 'package:flutter/material.dart';
import 'package:teams_soccer/src/teams/models/team.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Team> teams = [
    Team(id: '1', name: 'Real Madrid', votes: 300),
    Team(id: '2', name: 'Barcelona', votes: 200),
    Team(id: '3', name: 'Juventus', votes: 220),
    Team(id: '4', name: 'Paris Saint Germain', votes: 15),
    Team(id: '5', name: 'Bayern Munchen', votes: 163),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Teams',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
          itemCount: teams.length,
          itemBuilder: (BuildContext context, int index) =>
              buildListTile(teams[index])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewTeam();
        },
        child: Icon(Icons.add),
        elevation: 1,
      ),
    );
  }

  Widget buildListTile(Team team) {
    return Dismissible(
      key: Key(team.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {},
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: Row(
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Align(
                child: Text(
              'Eliminar equipo',
              style: TextStyle(color: Colors.white),
            )),
          ],
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.8),
            child: Text(team.name.substring(0, 1).toUpperCase())),
        title: Text(team.name),
        trailing: Text('${team.votes}'),
      ),
    );
  }

  addNewTeam() {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Agrega un nuevo equipo: '),
          content: TextField(
            controller: controller,
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                addTeamToList(controller.text);
              },
              child: Text('Añadir'),
            )
          ],
        );
      },
    );
  }

  void addTeamToList(String name) {
    if (name.length > 1) {
      this.teams.add(Team(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }

    Navigator.pop(context);
  }
}
