import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pro_1/main_screen.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _hidePassword = true;
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  @override

  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Instagram', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              controller: _emailCtrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username or Email',
                hintStyle: TextStyle(fontSize: 24, color: Colors.grey),
             ),
             textInputAction: TextInputAction.send,
              obscureText: false,
              autocorrect: false,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordCtrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
                hintStyle: TextStyle(fontSize: 24, color: Colors.grey),
                suffix: IconButton(onPressed:() {
                  setState(() {
                    _hidePassword = !_hidePassword;
                  });
                  debugPrint("$_hidePassword");
                }, 
                icon: Icon(_hidePassword ? Icons.visibility_off : Icons.visibility),
              ),
              ),
              textInputAction: TextInputAction.send,
              obscureText: _hidePassword,
              autocorrect: false,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              ),
              onPressed: () {
                if(_emailCtrl.text.trim() == 'admin' && 
                _passwordCtrl.text.trim() == 'admin'){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid username or password'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: const Text('Log In', style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}