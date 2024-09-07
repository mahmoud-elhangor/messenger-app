import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key, required this.text,required this.obscure,required this.controller});

  final String text;
  bool obscure=true;
var controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller:controller ,
      validator: (data) {
        if (data!.isEmpty && data == "") {
          return "value is wrong";
        }
        return null;
      },
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: text,
        labelText: text,
        labelStyle: const TextStyle(fontSize: 18, color: Colors.black),
        hintStyle: const TextStyle(fontSize: 18),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
