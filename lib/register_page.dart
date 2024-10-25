import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController =TextEditingController();
  final TextEditingController passwordController =TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
            Icon(Icons.person_add, size: 100, color: Colors.blueAccent),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nama Anda',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email Anda',
                border: OutlineInputBorder(),
                errorText: _validateEmail(emailController.text) ? null : 'Email tidak valid',
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                (context as Element).markNeedsBuild(); // Update errorText in real-time
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password Anda',
                border: OutlineInputBorder(),
                errorText: _validatePassword(passwordController.text) ? null : 'Password harus lebih dari 6 karakter',
              ),
              obscureText: true,
              onChanged: (value) {
                (context as Element).markNeedsBuild();
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Konfirmasi Password Anda',
                border: OutlineInputBorder(),
                errorText: _validateConfirmPassword(passwordController.text, confirmPasswordController.text) 
                    ? null : 'Password tidak cocok',
              ),
              obscureText: true,
              onChanged: (value) {
                (context as Element).markNeedsBuild();
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_validateForm()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Registrasi Berhasil!')),
                  );

                  // Mengarahkan kembali ke halaman login setelah registrasi berhasil
                  Navigator.pushNamedAndRemoveUntil(
                    context, 
                    '/login', 
                    (Route<dynamic> route) => false,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Data tidak valid. Silakan periksa kembali.')),
                  );
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(email);
  }

  bool _validatePassword(String password) {
    return password.length >= 6;
  }

  bool _validateConfirmPassword(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  bool _validateForm() {
    return _validateEmail(emailController.text) &&
           _validatePassword(passwordController.text) &&
           _validateConfirmPassword(passwordController.text, confirmPasswordController.text) &&
           nameController.text.isNotEmpty;
  }
}
