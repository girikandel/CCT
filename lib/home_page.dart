import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:message_app/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostModel> posts = [];
  final url = "https://jsonplaceholder.typicode.com/posts";
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    final response = await http.get(Uri.parse(url));
    posts = postModelFromJson(response.body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (cxt, ind) {
          return Card(
            child: Column(
              children: [
                Text(posts[ind].title),
                Text(posts[ind].body),
              ],
            ),
          );
        },
      ),
    );
  }
}
