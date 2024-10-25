import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class UniversityView extends StatefulWidget {
  @override
  _UniversityViewState createState() => _UniversityViewState();
}

class _UniversityViewState extends State<UniversityView> {
  TextEditingController country = TextEditingController();
  List universities = [];

  Future<void> getUniversities(String country) async {
    final url = Uri.parse('http://universities.hipolabs.com/search?country=$country');
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    setState(() {
      universities = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Universidades'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: country,
              decoration: InputDecoration(
                labelText: 'Pais en ingles',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                getUniversities(country.text);
              },
              child: Text('Buscar Universidades'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: universities.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(universities[index]['name']),
                    subtitle: Text(universities[index]['domains'][0]),
                    trailing: IconButton(
                      icon: Icon(Icons.link), // buscando iconos cuando flutter siempre los tuvo de base
                      onPressed: () {
                        final url = universities[index]['web_pages'][0];
                        final Uri uri = Uri.parse(url); // launchUrl no acepta strings somehow
                        launchUrl(uri);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
