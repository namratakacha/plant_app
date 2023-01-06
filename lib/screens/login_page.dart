import 'package:flutter/material.dart';
import 'package:plant_app/constants/colors_titles.dart';
import 'package:plant_app/screens/dashboard.dart';
import 'package:plant_app/screens/forgot_password_page.dart';
import 'package:plant_app/screens/signup_page.dart';

import '../widgets/custom_textField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

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
                Image.asset('assets/images/signin.png'),
                const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 30),
                CustomTextField(
                  controller: _emailController,
                  focusNode: emailFocus,
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
                SizedBox(height: 10),
                CustomTextField(
                  controller: _passwordController,
                  focusNode: passwordFocus,
                  validator: (value){
                    if(value== null || value.isEmpty){
                      return 'Please enter password';
                    }
                    return null;
                  },
                  obscureText: true,
                  hintText: 'Password',
                  icon: Icon(Icons.lock),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> DashBoard()));
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
                        'Sign In',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=> ForgotPasswordPage()));
                  },
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Forgot password?',
                              style: TextStyle(color: Constants.blackColor),),
                          TextSpan(
                            text: ' Reset here',
                            style: TextStyle(color: Constants.primaryColor),),
                        ]
                      )
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Text(' OR ', style: TextStyle(color: Colors.grey, fontSize: 12),),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  width: size.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Constants.primaryColor,
                    ), borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/google.png', height: 25,width: 25,),
                      SizedBox(width: 20),
                      Text('Sign in with google', style: TextStyle(fontSize: 16, color: Constants.blackColor),)
                    ],
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
