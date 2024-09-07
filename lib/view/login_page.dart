import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messaging_app/constant.dart';
import 'package:messaging_app/widget/custom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../helper/show_snack_bar.dart';
import '../widget/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routeName = "LoginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // String? email, password;
  bool isLoading = false;
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(

        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xff9CF1FD),
                Color(0xffDBC8F5),
              ])),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  kSizedBox,
                  Image.asset(
                    "assets/images/Rafiki.png",
                    height: 200,
                  ),
                  kSizedBox,
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  kSizedBox,
                  CustomTextFormField(
                    controller: emailController,
                    obscure: false,
                    text: "Email",
                  ),
                  kSizedBox,
                  CustomTextFormField(
                    controller:passwordController ,
                    obscure: true,
                    text: "Password",
                  ),
                  kSizedBox,
                  CustomButton(
                    textButton: "Login",
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await loginUser();
                          Navigator.pushReplacementNamed(context, "ChatPage",arguments: emailController.text);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackBar(context, "No user found for that email.");
                          } else if (e.code == "wrong-password") {
                            showSnackBar(context, "'Wrong password provided");
                          }
                        } catch (e) {
                          print(e);
                        }

                        isLoading = false;
                        setState(() {});
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account ? ",
                          style: TextStyle(fontSize: 20),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, "SignUpPage");
                            },
                            child: const Text(
                              "Sign Up",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.blue),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }

}
