import 'package:appwrite_userauth/appwriteservices.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late AppwriteServices _appwriteServices;
  final emailCrl=TextEditingController();
  final passwordCrl=TextEditingController();

  @override

  @override
  void initState() {
    super.initState();
    _appwriteServices = AppwriteServices();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
 SizedBox(height: 50,),
          Text("Log In",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold),),
          SizedBox(height: 10,),
          TextFormField(
            controller: emailCrl,
            decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Email")),
          ),
           SizedBox(height: 10,),
          TextFormField(
            controller: passwordCrl,
            obscureText: true,
            decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Password")),
          ),
        ],
      ),
    );
  }
}