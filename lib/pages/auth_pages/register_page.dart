import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hard_work_app/components/my_button.dart';
import 'package:hard_work_app/components/my_textfield.dart';
import 'package:hard_work_app/services/auth_service.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController confitmPasswordController = TextEditingController();

  void signUp() async {
    if (passwordController.text != confitmPasswordController.text) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("passwords don't match")));
      return;
    }
    // get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpemailandpassword(emailController.text, passwordController.text,nameController.text,surnameController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/picture/img_1.png",
                          ),
                        )),
                    // child: Image.asset("assets/picture/img_1.png",fit: BoxFit.fill,),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "HardWork ELC\nLet's create an account for you",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                // name
                MyTextField(
                  text: "Name",
                  controller: nameController,
                  obscureText: false,
                ),
                SizedBox(
                  height: 25,
                ),
                // surname
                MyTextField(
                  text: "Surname",
                  controller: surnameController,
                  obscureText: false,
                ),
                SizedBox(
                  height: 25,
                ),
                // email
                MyTextField(
                  text: "Email",
                  controller: emailController,
                  obscureText: false,
                ),
                SizedBox(
                  height: 10,
                ),
                // password
                MyTextField(
                  text: "Password",
                  controller: passwordController,
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),

                // confirm password
                MyTextField(
                  text: "Confirm password",
                  controller: confitmPasswordController,
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                // sign in button
                MyButton(
                  text: 'Sign Up',
                  onTap: signUp,
                ),
                SizedBox(height: 30),
                // not a  member? register now    text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member? ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Sign in now",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )),
    );
  }
}
