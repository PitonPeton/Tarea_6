import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AgeView extends StatefulWidget {
  @override
  _AgeViewState createState() => _AgeViewState();
}

class _AgeViewState extends State<AgeView> {
  TextEditingController name = TextEditingController();
  int? age;

  Future<void> predictAge(String name) async {
    final url = Uri.parse('https://api.agify.io/?name=$name');
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    setState(() {
      age = data['age'];
    });
  }

  String getCategory(int age) {
    if (age < 18) return 'Joven';
    if (age < 65) return 'Adulto';
    if (age >= 65) return 'Anciano';
    return 'Error';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prediccion de Edad'),
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
                predictAge(name.text);
              },
              child: Text('Predecir Edad'),
            ),
            SizedBox(height: 20),
            age != null
                ? Column(
                    children: [
                      Text(
                        'La edad aproximada es $age años',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Categoria: ${getCategory(age!)}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
