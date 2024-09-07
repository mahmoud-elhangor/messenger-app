import 'package:flutter/material.dart';

import '../constant.dart';
import '../models/message_model.dart';

class ReceiveMessages extends StatelessWidget {
  const ReceiveMessages({super.key,required this.message});
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: const BoxDecoration(
          color:kSecondColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        child:  Text(
          message.message,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}