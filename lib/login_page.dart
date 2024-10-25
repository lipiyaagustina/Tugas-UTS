import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 100, color: Colors.blueAccent),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: 'Email Anda', 
                  border: OutlineInputBorder(),
                  ),
                  keyboardType:  TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            TextField(
              controller:  passwordController,
              decoration: InputDecoration(
                  labelText: 'Password Anda', 
                  border: OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile', arguments: {
                  'name': 'Lipiya Agustina', 
                  'email': emailController.text.isEmpty ? 'user@example.com' : emailController.text,
                  'address': 'Jl. Cempaka 07', 
                  'phoneNumber': '0831263728638',
                });
               },
                child: Text('Login'),
            ),
            TextButton(onPressed:() {
              Navigator.pushNamed(context, '/register');
            },
            child: Text(
                  'Belum punya akun? Daftar',
                  style: TextStyle(color: Colors.black),
                ),
            ),
          ],
        ),
      ),
    );
  }
}