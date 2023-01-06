import 'package:flutter/material.dart';
import 'package:plant_app/screens/login_page.dart';
import 'package:plant_app/screens/signup_page.dart';

import '../constants/colors_titles.dart';
import '../widgets/custom_textField.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPWpageState();
}

class _ForgotPWpageState extends State<ForgotPasswordPage> {
  TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Image.asset('assets/images/reset-password.png'),
                SizedBox(height: 20),
                const Text(
                  'Forgot\nPassword',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 30),
                CustomTextField(
                  controller: _emailController,
                  validator: (value){
                    if(value== null || value.isEmpty){
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                  obscureText: false,
                  hintText: 'Email',
                  icon: Icon(Icons.email),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> LoginPage()));
                    }
                  },
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Constants.primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Text(
                        'Reset Password',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=> SignUpPage()));
                  },
                  child: Center(
                    child: Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(
                                text: 'New user?',
                                style: TextStyle(color: Constants.blackColor),),
                              TextSpan(
                                text: ' Register',
                                style: TextStyle(color: Constants.primaryColor),),
                            ]
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
