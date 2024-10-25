import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Contactame',
        style: TextStyle(
        ),
      )),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/Patata.jpg'),
                ),
              ),
              Text('Patata',
                  style: TextStyle(
                    fontSize: 18,
                  )),
              SizedBox(height: 8),
              Text('Patata@gmail.com',
                  style: TextStyle(
                    fontSize: 18,
                  )),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
