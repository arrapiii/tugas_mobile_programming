import 'package:flutter/material.dart';

import '../model/pegawai.dart';
import 'pegawai_form_page.dart';

class PegawaiDetail extends StatefulWidget {
  final Pegawai pegawai;
  final int? index;

  const PegawaiDetail({super.key, required this.pegawai, this.index});

  @override
  State<PegawaiDetail> createState() => _PegawaiDetailState();
}

class _PegawaiDetailState extends State<PegawaiDetail> {
  late Pegawai _pegawai;

  @override
  void initState() {
    super.initState();
    _pegawai = widget.pegawai;
  }

  Future<void> _ubah() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PegawaiFormPage(pegawai: _pegawai, isEdit: true),
      ),
    );

    if (result is Pegawai && mounted) {
      setState(() {
        _pegawai = result;
      });
      Navigator.pop(context, {'action': 'ubah', 'pegawai': _pegawai});
    }
  }

  Future<void> _hapus() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Konfirmasi Hapus'),
          content: Text('Yakin ingin menghapus data pegawai ${_pegawai.nama}?'),
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
      appBar: AppBar(title: const Text('Detail Pegawai')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NIP: ${_pegawai.nip}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            Text(
              'Nama: ${_pegawai.nama}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Text(
              'Tanggal Lahir: ${_pegawai.tanggalLahir}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Text(
              'Nomor Telepon: ${_pegawai.nomorTelepon}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Text(
              'Email: ${_pegawai.email}',
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
