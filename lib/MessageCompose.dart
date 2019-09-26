import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageCompose extends StatefulWidget {
  final Function(String message) _handleBlock;

  MessageCompose(this._handleBlock);

  @override
  State<StatefulWidget> createState() {
    return _MessageComposeState(_handleBlock);
  }
}

class _MessageComposeState extends State<MessageCompose> {
  Function(String message) _handleBlock;
  TextEditingController messageController = TextEditingController();

  _MessageComposeState(this._handleBlock);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Row(
        children: <Widget>[
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: 48.0,
              alignment: Alignment.center,
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: "Enter Message",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onSubmitted: _handleInput(messageController.text),
                controller: messageController,
              ),
            ),
          ),
          Container(
            child: IconButton(
              icon: Icon(Icons.send),
              color: Colors.red,
              onPressed: () => _handleInput(messageController.text),
            ),
          ),
        ],
      ),
    );
  }

  _handleInput(String message) {
    messageController.clear();
    _handleBlock(message);
  }
}
