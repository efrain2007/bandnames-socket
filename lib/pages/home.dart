import 'dart:io';

import 'package:band_name/models/band.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'material', votes: 12),
    Band(id: '2', name: 'sssssss', votes: 2),
    Band(id: '3', name: 'ssss', votes: 3),
    Band(id: '4', name: 'ssss', votes: 5),
    Band(id: '5', name: 'sssssssssss', votes: 10),
    Band(id: '6', name: 'sssssssssss', votes: 10),
    Band(id: '7', name: 'sssssssssss', votes: 10),
    Band(id: '8', name: 'sssssssssss', votes: 10),
    Band(id: '9', name: 'sssssssssss', votes: 10),
    Band(id: '5', name: 'sssssssssss', votes: 10),
    Band(id: '5', name: 'sssssssssss', votes: 10),
    Band(id: '5', name: 'sssssssssss', votes: 10),
    Band(id: '5', name: 'sssssssssss', votes: 10),
    Band(id: '5', name: 'sssssssssss', votes: 10),
    Band(id: '5', name: 'sssssssssss', votes: 10),
    Band(id: '5', name: 'sssssssssss', votes: 10),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'bandnames',
          style: TextStyle(color: Colors.black87),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, int i) => _bandTitle(bands[i]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addNewBand,
        elevation: 1,
      ),
    );
  }

  Widget _bandTitle(Band band) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        // bands.removeWhere((item) => item.id == band.id);
      },
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Delete Band ',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      key: Key(band.id),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            band.name.substring(0, 2),
          ),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text(
          '${band.votes}',
          style: TextStyle(fontSize: 20),
        ),
        onTap: () {
          print(band.name);
        },
      ),
    );
  }

  addNewBand() {
    final textController = new TextEditingController();
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (contex) {
          return AlertDialog(
            title: Text('new band name:'),
            content: TextField(controller: textController),
            actions: <Widget>[
              MaterialButton(
                child: Text('Add'),
                elevation: 50,
                textColor: Colors.blue,
                onPressed: () => addBandTolist(textController.text),
              )
            ],
          );
        },
      );
    }
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (contex) {
            return CupertinoAlertDialog(
              title: Text('new band name:'),
              content: CupertinoTextField(controller: textController),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text('Add'),
                  isDefaultAction: true,
                  onPressed: () => addBandTolist(textController.text),
                ),
                CupertinoDialogAction(
                  child: Text('dismis'),
                  isDestructiveAction: true,
                  onPressed: () => Navigator.pop(context),
                )
              ],
            );
          });
    }
  }

  void addBandTolist(String name) {
    if (name.length > 1) {
      this
          .bands
          .add(new Band(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }
    Navigator.pop(context);
  }
}
