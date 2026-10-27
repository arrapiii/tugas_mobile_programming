import 'package:flutter/material.dart';

import '../model/poli.dart';

class PoliFormPage extends StatefulWidget {
  final Poli? poli;
  final bool isEdit;

  const PoliFormPage({super.key, this.poli, this.isEdit = false});

  @override
  State<PoliFormPage> createState() => _PoliFormPageState();
}

class _PoliFormPageState extends State<PoliFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _namaPoliController;

  @override
  void initState() {
    super.initState();
    _namaPoliController = TextEditingController(
      text: widget.isEdit && widget.poli != null ? widget.poli!.namaPoli : '',
    );
  }

  @override
  void dispose() {
    _namaPoliController.dispose();
    super.dispose();
  }

  void _simpan() {
    if (_formKey.currentState!.validate()) {
      final poliBaru = Poli(
        id: widget.isEdit && widget.poli != null ? widget.poli!.id : null,
        namaPoli: _namaPoliController.text.trim(),
      );
      Navigator.pop(context, poliBaru);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.isEdit;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Ubah Data Poli' : 'Tambah Data Poli'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _namaPoliController,
              decoration: const InputDecoration(
                labelText: 'Nama Poli',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Nama Poli wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _simpan,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(isEdit ? 'Simpan Perubahan' : 'Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
