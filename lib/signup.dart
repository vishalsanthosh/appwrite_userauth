import 'package:appwrite_userauth/appwriteservices.dart';
import 'package:appwrite_userauth/login.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late AppwriteServices _appwriteServices;
   final nameC=TextEditingController();
   final emailC=TextEditingController();
   final passwordC=TextEditingController();

  @override
void initState(){
  super.initState();
  _appwriteServices=AppwriteServices();
}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UserAuthentication using Appwrite"),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
        children: [
          SizedBox(height: 50,),
          Text("Sign Up",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold),),
          SizedBox(height: 10,),
          TextFormField(
            controller: nameC,
            decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Name")),
          ),
           SizedBox(height: 10,),
          TextFormField(
            controller: emailC,
            decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Email")),
          ),
           SizedBox(height: 10,),
          TextFormField(
            controller: passwordC,
            obscureText: true,
            decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Password")),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () async {
                    if (nameC.text.isNotEmpty &&
                        emailC.text.isNotEmpty &&
                        passwordC.text.isNotEmpty) {
                      try {
                        await _appwriteServices.registerUser(
                          emailC.text,
                          passwordC.text,
                          nameC.text,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LogInScreen(),
                          ),
                        );
                        nameC.clear();
                        emailC.clear();
                        passwordC.clear();
                      } catch (e) {
                        print('Error adding user: $e');
                      }
                    }
                  }, child: Text("Sign Up")),
                  SizedBox(height: 50,),
                  GestureDetector(
                    onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInScreen()));
                    },child: Text("Already Have A Account?",style: TextStyle(color: Colors.red),),
                  )
        ],
        ),
      ),
    );
  }
}