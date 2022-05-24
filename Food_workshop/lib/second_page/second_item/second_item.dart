

import 'package:flutter/material.dart';

class SecondItem extends StatefulWidget {
  const SecondItem({Key? key}) : super(key: key);

  @override
  State<SecondItem> createState() => _SecondItemState();
}

class _SecondItemState extends State<SecondItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Second ITem'),),
    );
  }
}
