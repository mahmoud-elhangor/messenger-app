import 'package:flutter/material.dart';
import 'package:messaging_app/models/message_model.dart';

class SendMessages extends StatelessWidget {
  const SendMessages({super.key,required this.message});
final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
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
