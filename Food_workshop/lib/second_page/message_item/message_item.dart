
import 'package:flutter/material.dart';

class MessageItem extends StatefulWidget {
  const MessageItem({Key? key}) : super(key: key);

  @override
  State<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Center(child: Text('Message Item'),),
    );
  }
}


