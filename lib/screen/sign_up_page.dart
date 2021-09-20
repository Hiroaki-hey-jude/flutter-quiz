import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:quiz/global/email_password_auth.dart';
import 'package:quiz/global/enum.dart';
import 'package:quiz/global/reg_exp.dart';
import 'package:quiz/screen/log_in_page.dart';
import 'package:quiz/widget/common_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _signUpKey = GlobalKey();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confPass = TextEditingController();
  final EmailPasswordAuth emailPasswordAuth = EmailPasswordAuth();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: LoadingOverlay(
          isLoading: _isLoading,
          child: Container(
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 56,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Sign-Up',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.9,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 40, bottom: 40),
                  child: Form(
                    key: _signUpKey,
                    child: ListView(
                      children: [
                        commonTextFormField(
                          hintText: 'Email',
                          validator: (inputVal) {
                            if (!emailRegex.hasMatch(inputVal.toString()))
                              return 'Email format not Matching';
                            return null;
                          },
                          textEditingController: this.email,
                        ),
                        commonTextFormField(
                          hintText: 'Password',
                          validator: (inputVal) {
                            if (inputVal!.length < 6)
                              return 'password must be more than 6 words';
                            return null;
                          },
                          textEditingController: this.password,
                        ),
                        commonTextFormField(
                          hintText: 'Confirm Password',
                          validator: (inputVal) {
                            if (inputVal!.length < 6)
                              return 'Confirm Password must be at least 6 characters';
                            if (this.password.text != this.confPass.text)
                              return 'Confirm password and Password not same';
                            return null;
                          },
                          textEditingController: this.confPass,
                        ),
                        signUpAuthButton(context, 'Sign-Up'),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Or Continue With',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                ),
                switchAnotherAuthScreen(
                    context, 'already have an account? ', 'Log-in'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget signUpAuthButton(BuildContext context, String buttonName) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width - 60, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 25,
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () async {
          if (this._signUpKey.currentState!.validate()) {
            SystemChannels.textInput.invokeMethod('TextInput.hide');
            print('validated');
            if (mounted) {
              setState(() {
                this._isLoading = true;
              });
            }

            FirebaseAuth.instance.createUserWithEmailAndPassword(email: this.email.text, password: this.password.text)
            .then((currentUser) => FirebaseFirestore.instance.collection('users')
                .add({
                  'email': email.text,
                  'uid': currentUser.user!.uid,
                 }).then((value) => print(value.id))
            );
            print('これはできてるんですか？');

            final EmailSignResults response = await this
                .emailPasswordAuth
                .signUpAuth(
                    email: this.email.text, password: this.password.text);
            if (response == EmailSignResults.SignUpCompleted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) => LogInScreen()));
            } else {
              final String message =
              response == EmailSignResults.EmailAlreadyPresent
                  ? 'Email already Present'
                  : 'Sign Up Completed';
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(message)));
            }
          } else
            print('not Validated');
          if (mounted) {
            setState(() {
              this._isLoading = false;
            });
          }
        },
      ),
    );
  }
}
