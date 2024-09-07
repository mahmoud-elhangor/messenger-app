import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messaging_app/view/chat_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constant.dart';
import '../helper/show_snack_bar.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const String routeName = "SignUpPage";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Create Account"),
          backgroundColor: const Color(0xff9CF1FD),
        ),
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
                  const SizedBox(
                    height: 260,
                  ),
                  const Text(
                    "Sign Up",
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
                    controller: passwordController,
                    obscure: true,
                    text: "Password",
                  ),
                  kSizedBox,
                  CustomButton(
                    textButton: "Register",
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await registerUser();
                          showSnackBar(context, " Success");
                          Navigator.pushReplacementNamed(context, "ChatPage",arguments: emailController);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == "weak-password") {
                            showSnackBar(context, "Weak Password");
                          } else if (e.code == "email-already-in-use") {
                            showSnackBar(context, " Email Already Exist");
                          }
                        } catch (e) {
                          print(e);
                        }

                        isLoading = false;
                        setState(() {});

                        // Navigator.pop(context);
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
                          "Already have an account ? ",
                          style: TextStyle(fontSize: 20),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "LoginPage");
                            },
                            child: const Text(
                              "Login",
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

  Future<void> registerUser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }
}
