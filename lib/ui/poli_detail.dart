import 'package:flutter/material.dart';

import '../model/poli.dart';
import 'poli_form_page.dart';

class PoliDetail extends StatefulWidget {
  final Poli poli;
  final int? index;

  const PoliDetail({super.key, required this.poli, this.index});

  @override
  State<PoliDetail> createState() => _PoliDetailState();
}

class _PoliDetailState extends State<PoliDetail> {
  late Poli _poli;

  @override
  void initState() {
    super.initState();
    _poli = widget.poli;
  }

  Future<void> _ubah() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PoliFormPage(poli: _poli, isEdit: true),
      ),
    );

    if (result is Poli && mounted) {
      setState(() {
        _poli = result;
      });
      Navigator.pop(context, {'action': 'ubah', 'poli': _poli});
    }
  }

  Future<void> _hapus() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Konfirmasi Hapus'),
          content: Text('Yakin ingin menghapus ${_poli.namaPoli}?'),
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
      appBar: AppBar(title: const Text("Detail Poli")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              "Nama Poli : ${_poli.namaPoli}",
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
                  child: const Text("Ubah"),
                ),
                ElevatedButton(
                  onPressed: _hapus,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Hapus"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
