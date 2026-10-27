import 'package:flutter/material.dart';

import '../model/pasien.dart';
import 'pasien_detail.dart';
import 'pasien_form_page.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  final List<Pasien> daftarPasien = [
    Pasien(
      nomorRm: 'RM001',
      nama: 'Budi Santoso',
      tanggalLahir: '2001-03-15',
      nomorTelepon: '081234567890',
      alamat: 'Depok',
    ),
    Pasien(
      nomorRm: 'RM002',
      nama: 'Siti Aminah',
      tanggalLahir: '2002-07-20',
      nomorTelepon: '081298765432',
      alamat: 'Jakarta',
    ),
  ];

  void bukaDetailPasien(Pasien pasien, int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PasienDetail(pasien: pasien, index: index),
      ),
    );

    if (result == null) return;

    if (result is Map<String, dynamic>) {
      final action = result['action'];
      if (action == 'hapus') {
        setState(() {
          daftarPasien.removeAt(index);
        });
      } else if (action == 'ubah' && result['pasien'] is Pasien) {
        setState(() {
          daftarPasien[index] = result['pasien'];
        });
      }
    } else if (result is Pasien) {
      setState(() {
        daftarPasien[index] = result;
      });
    }
  }

  void tambahPasien() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasienFormPage(isEdit: false),
      ),
    );

    if (result is Pasien && mounted) {
      setState(() {
        daftarPasien.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pasien'),
        actions: [
          IconButton(
            onPressed: tambahPasien,
            icon: const Icon(Icons.add),
            tooltip: 'Tambah Pasien',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: daftarPasien.length,
        itemBuilder: (context, index) {
          final pasien = daftarPasien[index];

          return Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(pasien.nama),
              subtitle: Text('No. RM: ${pasien.nomorRm}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => bukaDetailPasien(pasien, index),
            ),
          );
        },
      ),
    );
  }
}
