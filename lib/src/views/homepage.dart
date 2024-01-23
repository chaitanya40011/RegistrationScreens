
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class HomePage extends StatelessWidget {
  final String apiUrl = "https://reqres.in/api/users?page=2";

  const HomePage({super.key});

  Future<List<dynamic>> fetchUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future builder'),
      ),
      body: FutureBuilder(
        future: fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List? users = snapshot.data;

            return ListView.builder(
              itemCount: users?.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[350],
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(8.0),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                  [

                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${users?[index]['first_name']} ${users?[index]['last_name']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        users?[index]['email'],
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                    Icon(Icons.search),
                  ],
                ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
