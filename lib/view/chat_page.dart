import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messaging_app/widget/receive_messages.dart';
import '../models/message_model.dart';
import '../widget/send_messages.dart';
import '../widget/slidable.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  static const String routeName = "ChatPage";

  CollectionReference messages =
      FirebaseFirestore.instance.collection("messages");

  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy("createdAt", descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(
              MessageModel.fromJson(snapshot.data!.docs[i]),
            );
          }
          return Scaffold(
            drawer: const Slidable(),
            appBar: AppBar(
              // automaticallyImplyLeading: false,
              centerTitle: true,
              title: const Text(
                "Messenger",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black,
            ),
            body: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Color(0xffDBC8F5),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: _controller,
                        itemCount: messagesList.length,
                        itemBuilder: (context, index) {
                          return messagesList[index].id == email
                              ? SendMessages(
                                  message: messagesList[index],
                                )
                              : ReceiveMessages(
                                  message: messagesList[index],
                                );
                        },
                      ),
                    ),
                    TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messages.add({
                          "messages": data,
                          "createdAt": DateTime.now(),
                          "id": email
                        });
                        controller.clear();
                        _controller.jumpTo(0);
                      },
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                      decoration: InputDecoration(
                        hintText: "Send Message",
                        suffixIcon: InkWell(
                            onTap: () {
                            }, child: const Icon(Icons.send)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.black)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ));
        }
      },
    );
  }
}
