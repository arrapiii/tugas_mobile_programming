import 'package:flutter/material.dart';

import '../model/pasien.dart';
import 'pasien_form_page.dart';

class PasienDetail extends StatefulWidget {
  final Pasien pasien;
  final int? index;

  const PasienDetail({super.key, required this.pasien, this.index});

  @override
  State<PasienDetail> createState() => _PasienDetailState();
}

class _PasienDetailState extends State<PasienDetail> {
  late Pasien _pasien;

  @override
  void initState() {
    super.initState();
    _pasien = widget.pasien;
  }

  Future<void> _ubah() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PasienFormPage(pasien: _pasien, isEdit: true),
      ),
    );

    if (result is Pasien && mounted) {
      setState(() {
        _pasien = result;
      });
      Navigator.pop(context, {'action': 'ubah', 'pasien': _pasien});
    }
  }

  Future<void> _hapus() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Konfirmasi Hapus'),
          content: Text('Yakin ingin menghapus data pasien ${_pasien.nama}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );

    if (confirm == true && mounted) {
      Navigator.pop(context, {'action': 'hapus'});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Pasien')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nomor RM: ${_pasien.nomorRm}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Text('Nama: ${_pasien.nama}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            Text(
              'Tanggal Lahir: ${_pasien.tanggalLahir}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Text(
              'Nomor Telepon: ${_pasien.nomorTelepon}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Text(
              'Alamat: ${_pasien.alamat}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _ubah,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Ubah'),
                ),
                ElevatedButton(
                  onPressed: _hapus,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Hapus'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
