import 'package:flutter/material.dart';

class BarisKolomPage extends StatelessWidget {
  const BarisKolomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Baris dan Kolom',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: const Color(0xFFFAFAFA),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: const [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Baris 1, Kolom 1',
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Baris 1, Kolom 2',
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Baris 1, Kolom 3',
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: const [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Baris 2, Kolom 1',
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Baris 2, Kolom 2',
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Baris 2, Kolom 3',
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: const [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Baris 3, Kolom 1',
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Baris 3, Kolom 2',
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Baris 3, Kolom 3',
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
