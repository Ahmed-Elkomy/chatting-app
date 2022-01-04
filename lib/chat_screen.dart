import 'package:flutter/material.dart';
import 'modules/contact_data.dart';

class ChatScreen extends StatefulWidget {
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  TextEditingController controller = TextEditingController();
  List<ContactData> _contacts = List();
  String _name = "Ahmed Elkomy2";
  AnimationController animationController;
  var _textExist = false;

  @override
  Widget build(BuildContext context) {
    Widget _listOfContacts = Flexible(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return SizeTransition(
              sizeFactor: CurvedAnimation(
                  parent: animationController, curve: Curves.easeOut),
              axisAlignment: 0.0,
              child: Container(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(_contacts.elementAt(index).name[0]),
                  ),
                  title: Text(
                    _contacts.elementAt(index).name,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  subtitle: Text(
                    _contacts.elementAt(index).messages.elementAt(
                        (_contacts.elementAt(index).messages.length - 1)),
                    style: Theme.of(context).textTheme.body1,
                  ),
                ),
              ),
            );
          },
          itemCount: _contacts.length,
          reverse: true,
        ),
      ),
    );

    Widget _messageComposer = Container(
      color: Theme.of(context).cardColor,
      child: Row(
        children: <Widget>[
          Flexible(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    hintText: "Send a Message", border: InputBorder.none),
                onSubmitted: _sendText,
                onChanged: (text) {
                  setState(() {
                    text.length > 0 ? _textExist = true : _textExist = false;
                  });
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(
                Icons.send,
                color: _textExist ? Theme.of(context).accentColor : Colors.grey,
              ),
              onPressed: () => _sendText(controller.text),
            ),
          )
        ],
      ),
    );
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatting Applicatoin"),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0 : 4.0,
      ),
      body: Column(
        children: <Widget>[
          _listOfContacts,
          Divider(
            height: 1,
          ),
          _messageComposer
        ],
      ),
    );
  }

  _sendText(String text) {
    if (_textExist) {
      controller.text = "";
      animationController = null;
      animationController = AnimationController(
          vsync: this, duration: Duration(microseconds: 2000));
      ContactData newContact = ContactData(name: _name, messages: [text]);
      setState(() {
        _contacts.insert(0, newContact);
        _textExist = false;
      });
      animationController.forward();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }
}
