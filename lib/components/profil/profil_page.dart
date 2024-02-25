import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: ProfilBody(),
    );
  }
}

class ProfilBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/profile_image.jpg'),
          ),
          SizedBox(height: 20),
          Text(
            'Nom d\'utilisateur',
            style: TextStyle(fontSize: 24, color: Colors.blueAccent),
          ),
          SizedBox(height: 10),
          Text(
            'Description de l\'utilisateur...',
            style: TextStyle(fontSize: 16, color: Colors.blue),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
