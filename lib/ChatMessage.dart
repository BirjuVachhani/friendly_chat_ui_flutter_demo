import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String _message;
  final AnimationController animController;

  ChatMessage(this._message, {this.animController});

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axisAlignment: 0.0,
      sizeFactor: CurvedAnimation(
        curve: Curves.easeOut,
        parent: animController,
      ),
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: Text(
                  "B",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              ),
            ),
            Container(
              child: Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Birju Vachhani",
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 3.0),
                      child: Text(
                        _message,
                        overflow: TextOverflow.fade,
                        softWrap: true,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
