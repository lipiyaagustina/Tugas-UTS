import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String name = args['name'] ?? ' Guest';
    final String email = args['email'] ?? 'N/A';
    final String address = args['address'] ?? 'Tidak diketahui';
    final String phoneNumber = args['phoneNumber']?? 'Tidak diketahui';

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding
      (padding:const EdgeInsets.all(16.0),
      child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.person,  size: 100, color: Colors.blueAccent),
          SizedBox(height: 20),
          Text('Nama: $name', style: TextStyle(fontSize: 18)),
          Text('Email: $email', style: TextStyle(fontSize: 18)),
          Text('Alamat: $address', style: TextStyle(fontSize: 18)),
          Text('Nomor Telepon: $phoneNumber', style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text('Keluar'),
           ),
         ],
        ),
      ),
    ),
  );
 }
}