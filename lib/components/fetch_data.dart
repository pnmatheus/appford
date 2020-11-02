import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Post {
  Post({
    this.postClass,
  });

  String postClass;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        postClass: json["class"],
      );

  Map<String, dynamic> toJson() => {
        "class": postClass,
      };
}

Future<Post> fetchPost(String url) async {
  // String url =
  //     "https://firebasestorage.googleapis.com/v0/b/ford-project-9ccb2.appspot.com/o/pictures%2Ftemp_motor6.jpeg?alt=media&token=ff8cb74b-711d-46a1-8109-f0500c0334a1";
  final http.Response response = await http.post(
    'http://192.168.1.164:8080/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'url': url,
    }),
  );
  if (response.statusCode == 200) {
    // se o servidor retornar um response OK, vamos fazer o parse no JSON
    return Post.fromJson(json.decode(response.body));
  } else {
    // se a responsta não for OK , lançamos um erro
    throw Exception('Aguardando resposta do servidor.');
  }
}

class FetchData extends StatefulWidget {
  final String url;

  FetchData({this.url});

  @override
  _FetchDataState createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  var error;
  Map data;
  bool filed = false;

  Future<void> fetchData(String classe) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('errors_desc');
    collectionReference
        .where('class', isEqualTo: classe)
        .snapshots()
        .listen((snapshot) {
      setState(() {
        data = snapshot.docs[0].data();
        filed = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Future<Post> post = fetchPost(widget.url.toString());
    return FutureBuilder<Post>(
      future: post,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // return Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(snapshot.data.postClass),
          // );
          fetchData(snapshot.data.postClass);
          return filed == true
              ? SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      if (data['risk'] == 'Alto')
                        Card(
                          margin: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 10,
                          ),
                          color: Color.fromRGBO(233, 116, 107, 20),
                          child: ListTile(
                            leading: Icon(
                              Icons.cancel,
                              color: Colors.black,
                              size: 30,
                            ),
                            title: Text(
                              'Visite um concessionária Ford urgente!',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Clique no calendário para agendar uma visita.',
                              style: TextStyle(fontSize: 12),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () {},
                              color: Colors.black,
                            ),
                          ),
                        ),
                      Card(
                        margin: const EdgeInsets.all(10),
                        elevation: 5,
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Image.network(
                              data['icon'],
                              height: 30,
                            ),
                            backgroundColor: Color.fromRGBO(152, 216, 226, 70),
                          ),
                          title: Text(
                            data['title'],
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Text(
                              data['error_desc'],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
}
