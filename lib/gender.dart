import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GenderView extends StatefulWidget {
  @override
  _GenderViewState createState() => _GenderViewState();
}

class _GenderViewState extends State<GenderView> {
  TextEditingController name = TextEditingController();
  String? gender;

  Future<void> predictGender(String name) async {
    final url = Uri.parse('https://api.genderize.io/?name=$name');
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    setState(() {
      gender = data['gender'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prediccion de Genero'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: 'Nombre',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                predictGender(name.text);
              },
              child: Text('Predecir Genero'),
            ),
            SizedBox(height: 20),
            gender != null
                ? Container(
                    color: gender == 'male' ? Colors.blue : Colors.pink,
                    padding: EdgeInsets.all(16), // padding al rededor de todo, re conveniente
                    child: Text(
                      'El género es $gender',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
