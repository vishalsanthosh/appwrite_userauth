import 'package:appwrite_userauth/appwriteservices.dart';
import 'package:appwrite_userauth/home.dart';
import 'package:appwrite_userauth/signup.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
            SizedBox(height: 25,),
            ElevatedButton(onPressed: ()async{
              if (emailCrl.text.isNotEmpty&&passwordCrl.text.isNotEmpty){
                try{
                  await _appwriteServices.loginUser(emailCrl.text, passwordCrl.text);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  emailCrl.clear();
                  passwordCrl.clear();
                }catch(e){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("check and try again")));
                }
              }
            }, child: Text("Log In")),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
              },child: Text("Dont Have An Account?",style: TextStyle(color: Colors.red),),
            )
          ],
        ),
      ),
    );
  }
}