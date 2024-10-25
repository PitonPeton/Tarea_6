import 'package:flutter/material.dart';
import 'gender.dart';
import 'age.dart';
import 'uni.dart';
import 'wordpress.dart';
import 'about.dart';

void main() {
  runApp(Tarea_6());
}

class Tarea_6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea 6',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarea 6'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Prediccion de genero'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GenderView()),
                );
              },
            ),
            ListTile(
              title: Text('Prediccion de edad'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgeView()),
                );
              },
            ),
            ListTile(
              title: Text('Universidades'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UniversityView()),
                );
              },
            ),
/* 
            ListTile(
              title: Text('Clima en RD'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeatherPage()),
                );
              },
            ),
*/
            ListTile(
              title: Text('Noticias de WordPress'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WordPressView()),
                );
              },
            ),
            ListTile(
              title: Text('Contactame'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutMe()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
