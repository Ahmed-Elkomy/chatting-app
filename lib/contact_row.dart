import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  ContactsState createState() => ContactsState();
}

class ContactsState extends State<Contacts> {
String _myMame = "Ahmed Samir";
String _lastMessage= " How are you?";
//List <ChatMessage> _messags  = <ChatMessage>;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget contact = Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right:10),
              child: CircleAvatar(
                child: Text(_myMame[0]),
                backgroundColor: Theme.of(context).accentColor,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(_name(),style: Theme.of(context).textTheme.subhead),
                Container(
                  child: Text(_status()),
                  margin: EdgeInsets.only(top:10),
                )
              ],
            )
          ],
        ));
    return Scaffold(
        appBar: AppBar(
          title: Text("Friendly App"),
        ),
        body: contact);
  }

  String _name() {
    return _myMame;
  }

  String _status() {
    return _lastMessage;
  }
}
