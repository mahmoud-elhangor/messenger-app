import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key, required this.textButton, this.onTap});
VoidCallback? onTap;
String textButton;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Colors.black,
            Colors.black26
          ]),
            color:Colors.blue ,
            borderRadius: BorderRadius.circular(12)),
        height: 60,
        width: double.infinity,
        child:  Center(child: Text(textButton,style: const TextStyle(fontSize: 24,color: Colors.white),)),
      ),
    );
  }
}
