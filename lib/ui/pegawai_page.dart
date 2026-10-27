import 'package:flutter/material.dart';

import '../model/pegawai.dart';
import 'pegawai_detail.dart';
import 'pegawai_form_page.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  final List<Pegawai> daftarPegawai = [
    Pegawai(
      nip: 'PGW001',
      nama: 'Andi Saputra',
      tanggalLahir: '2000-05-12',
      nomorTelepon: '081234567890',
      email: 'andi@gmail.com',
      password: 'pegawai123',
    ),
    Pegawai(
      nip: 'PGW002',
      nama: 'Siti Aminah',
      tanggalLahir: '1998-08-20',
      nomorTelepon: '081298765432',
      email: 'siti@gmail.com',
      password: 'pegawai456',
    ),
  ];

  void bukaDetailPegawai(Pegawai pegawai, int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PegawaiDetail(pegawai: pegawai, index: index),
      ),
    );

    if (result == null) return;

    if (result is Map<String, dynamic>) {
      final action = result['action'];
      if (action == 'hapus') {
        setState(() {
          daftarPegawai.removeAt(index);
        });
      } else if (action == 'ubah' && result['pegawai'] is Pegawai) {
        setState(() {
          daftarPegawai[index] = result['pegawai'];
        });
      }
    } else if (result is Pegawai) {
      setState(() {
        daftarPegawai[index] = result;
      });
    }
  }

  void tambahPegawai() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PegawaiFormPage(isEdit: false),
      ),
    );

    if (result is Pegawai && mounted) {
      setState(() {
        daftarPegawai.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pegawai'),
        actions: [
          IconButton(
            onPressed: tambahPegawai,
            icon: const Icon(Icons.add),
            tooltip: 'Tambah Pegawai',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: daftarPegawai.length,
        itemBuilder: (context, index) {
          final pegawai = daftarPegawai[index];

          return Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(pegawai.nama),
              subtitle: Text('NIP: ${pegawai.nip}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => bukaDetailPegawai(pegawai, index),
            ),
          );
        },
      ),
    );
  }
}
