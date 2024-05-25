import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:go_router/go_router.dart';
import 'main.dart';
import  'package:http/http.dart' as http;
import 'dart:convert';


class feedback extends StatelessWidget {
  TextEditingController feedbackController = TextEditingController();

  
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(),
      ),
   
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFB4E1FF), Color1])),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(200),child:InkWell(onTap: (){
                
                context.replace("/");
              },child: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('lib/assets/icon.png'), fit: BoxFit.contain)), height: 150, width: 150))),
              Padding(
                padding: const EdgeInsets.only(left:122.0,right: 122),
                child: Divider(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(100.0),
                child: TextField(
                  controller: feedbackController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your feedback here',
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFB4E1FF)),
                ),
                onPressed: () async {
                 

                

                  final response = await http.post(
                          Uri.https(
                              "weather-app-d14d8-default-rtdb.asia-southeast1.firebasedatabase.app",
                              "Names.json"),
                          headers: {"Content-Type": "application/json"},
                          body: json.encode({"email": feedbackController.text}));
                          feedbackController.clear();
                },
                child: Text('Submit Feedback',style: TextStyle(color: Colors.black),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}