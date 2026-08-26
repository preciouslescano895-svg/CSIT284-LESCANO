import 'package:flutter/material.dart';

 
void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
           Color.fromARGB(255, 73, 7, 189),
           Color.fromARGB(255, 73, 6, 184),
        ],
      ),  
    ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assetss/logo.png',
              width: 150,
              ),
                Text(
                '? ? ?',
                style: TextStyle(
                  fontSize: 25,
                  color: const Color.fromARGB(255, 202, 185, 185),
                ),
              ),

              const FlutterLogo(size: 100),
              const SizedBox(height: 40),
              const Text(
                'Learn Flutter the fun way!',
                style: TextStyle(
                  color: const Color.fromARGB(255, 202, 185, 185),
                  fontSize: 20,
                ),
              ),

              TextButton(
                onPressed: () {},
                child: const Text(
                  'Start Quiz',
                  style: TextStyle(color:const Color.fromARGB(255, 202, 185, 185),),
                ),
              ),
            ],
          ),
          ),
        ),
      ),
    ),
  );
}