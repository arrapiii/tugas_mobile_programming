import 'package:flutter/material.dart';

import '../model/pasien.dart';

class PasienFormPage extends StatefulWidget {
  final Pasien? pasien;
  final bool isEdit;

  const PasienFormPage({super.key, this.pasien, this.isEdit = false});

  @override
  State<PasienFormPage> createState() => _PasienFormPageState();
}

class _PasienFormPageState extends State<PasienFormPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nomorRmController;
  late TextEditingController _namaController;
  late TextEditingController _tanggalLahirController;
  late TextEditingController _nomorTeleponController;
  late TextEditingController _alamatController;

  @override
  void initState() {
    super.initState();
    final p = widget.pasien;
    _nomorRmController = TextEditingController(
      text: widget.isEdit && p != null ? p.nomorRm : '',
    );
    _namaController = TextEditingController(
      text: widget.isEdit && p != null ? p.nama : '',
    );
    _tanggalLahirController = TextEditingController(
      text: widget.isEdit && p != null ? p.tanggalLahir : '',
    );
    _nomorTeleponController = TextEditingController(
      text: widget.isEdit && p != null ? p.nomorTelepon : '',
    );
    _alamatController = TextEditingController(
      text: widget.isEdit && p != null ? p.alamat : '',
    );
  }

  @override
  void dispose() {
    _nomorRmController.dispose();
    _namaController.dispose();
    _tanggalLahirController.dispose();
    _nomorTeleponController.dispose();
    _alamatController.dispose();
    super.dispose();
  }

  void _simpan() {
    if (_formKey.currentState!.validate()) {
      final pasienBaru = Pasien(
        id: widget.isEdit && widget.pasien != null ? widget.pasien!.id : null,
        nomorRm: _nomorRmController.text.trim(),
        nama: _namaController.text.trim(),
        tanggalLahir: _tanggalLahirController.text.trim(),
        nomorTelepon: _nomorTeleponController.text.trim(),
        alamat: _alamatController.text.trim(),
      );
      Navigator.pop(context, pasienBaru);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.isEdit;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Ubah Data Pasien' : 'Tambah Data Pasien'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nomorRmController,
              decoration: const InputDecoration(
                labelText: 'Nomor RM',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Nomor RM wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Nama wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _tanggalLahirController,
              decoration: const InputDecoration(
                labelText: 'Tanggal Lahir (YYYY-MM-DD)',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Tanggal lahir wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _nomorTeleponController,
              decoration: const InputDecoration(
                labelText: 'Nomor Telepon',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Nomor telepon wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _alamatController,
              decoration: const InputDecoration(
                labelText: 'Alamat',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Alamat wajib diisi';
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
