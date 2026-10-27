import 'package:flutter/material.dart';

import '../model/poli.dart';
import 'poli_detail.dart';
import 'poli_form_page.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  final List<Poli> daftarPoli = [
    Poli(namaPoli: "Poli Anak"),
    Poli(namaPoli: "Poli Kandungan"),
    Poli(namaPoli: "Poli Gigi"),
    Poli(namaPoli: "Poli THT"),
  ];

  void bukaDetailPoli(Poli poli, int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PoliDetail(poli: poli, index: index),
      ),
    );

    if (result == null) return;

    if (result is Map<String, dynamic>) {
      final action = result['action'];
      if (action == 'hapus') {
        setState(() {
          daftarPoli.removeAt(index);
        });
      } else if (action == 'ubah' && result['poli'] is Poli) {
        setState(() {
          daftarPoli[index] = result['poli'];
        });
      }
    } else if (result is Poli) {
      setState(() {
        daftarPoli[index] = result;
      });
    }
  }

  void tambahPoli() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PoliFormPage(isEdit: false),
      ),
    );

    if (result is Poli && mounted) {
      setState(() {
        daftarPoli.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Poli"),
        actions: [
          IconButton(
            onPressed: tambahPoli,
            icon: const Icon(Icons.add),
            tooltip: 'Tambah Poli',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: daftarPoli.length,
        itemBuilder: (context, index) {
          final poli = daftarPoli[index];
          return Card(
            child: ListTile(
              title: Text(poli.namaPoli),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => bukaDetailPoli(poli, index),
            ),
          );
        },
      ),
    );
  }
}
