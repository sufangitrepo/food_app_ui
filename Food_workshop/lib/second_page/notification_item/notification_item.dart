


import 'package:flutter/material.dart';

class NotificationItem extends StatefulWidget {
  const NotificationItem({Key? key}) : super(key: key);

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Bell Icon'),),
    );
  }
}
