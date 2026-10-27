import 'package:flutter/material.dart';

void main() => runApp(const Tugas());

class Tugas extends StatelessWidget {
  const Tugas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Baris dan Kolom',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int baris = 1; baris <= 3; baris++)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int kolom = 1; kolom <= 3; kolom++)
                    Text(
                      'Baris $baris, Kolom $kolom',
                      style: const TextStyle(fontSize: 12),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
