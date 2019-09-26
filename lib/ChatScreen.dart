import 'package:flutter/material.dart';
import 'package:friendly_chat/ChatMessage.dart';
import 'package:friendly_chat/MessageCompose.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChatScreenState();
  }
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Friendly Chat",
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Friendly Chat"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Flexible(
                child: Container(
                  child: ListView.builder(
                    itemBuilder: (_, position) => _messages[position],
                    itemCount: _messages.length,
                    reverse: true,
                  ),
                ),
              ),
              MessageCompose(_handleMessage),
            ],
          ),
        ),
      ),
    );
  }

  _handleMessage(String text) {
    if (text.isEmpty) return;
    ChatMessage message = ChatMessage(text,
        animController: new AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 300),
        ));
    setState(() {
      _messages.insert(0, message);
    });
    message.animController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    for (ChatMessage message in _messages) {
      message.animController.dispose();
    }
  }
}
