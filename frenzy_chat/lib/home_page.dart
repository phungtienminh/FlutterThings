import 'package:flutter/material.dart';
import 'package:frenzy_chat/chat_message.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  List<ChatMessage> _messageList = List<ChatMessage>();

  void sendMessage() {
    if (_controller.text == null || _controller.text.length == 0) return;

    setState(() {
      _messageList.add(ChatMessage(message: _controller.text));
      _controller.clear();

      while (_messageList.length > 10) {
        _messageList.removeAt(0);
      }
    });
  }

  Widget chatLayout() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Flexible(
            child: ListView.separated(
              padding: const EdgeInsets.all(8.0),
              itemCount: _messageList.length,
              itemBuilder: (context, index) => _messageList[index],
              separatorBuilder: (context, index) => Divider(height: 1.0),
            ),
          ),
          Divider(
            height: 1.0,
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Enter message",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[500], 
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconButton(
                    icon: Icon(Icons.send),
                    color: Theme.of(context).primaryColor,
                    onPressed: () => sendMessage(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frenzy Chat"),
        centerTitle: true,
      ),
      body: chatLayout(),
    );
  }
}