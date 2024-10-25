import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class WordPressView extends StatefulWidget {
  @override
  _WordPressViewState createState() => _WordPressViewState();
}

class _WordPressViewState extends State<WordPressView> {
  List<dynamic> posts = [];

  Future<void> getPosts() async {
    final url = Uri.parse('https://newsroom.spotify.com/wp-json/wp/v2/posts');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        posts = jsonDecode(response.body);
      });
    } else {
      throw Exception('Error cargando los posts');
    }
  }

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias de WordPress'),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          final post = posts[index];
          final title = post['title']['rendered'];
          final summary = post['excerpt']['rendered'];
          final url = post['link'];
          final Uri uri = Uri.parse(url);

          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(title),
              subtitle: Text(
                  summary.replaceAll(RegExp(r'<[^>]*>'),
                      ''), // tremendo, las etiquetas de html se quedan en los parrafos
                  maxLines: 2),
              trailing: IconButton(
                icon: Icon(Icons.link),
                onPressed: () async {
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
