import 'package:flutter/material.dart';

import '../model/pegawai.dart';

class PegawaiFormPage extends StatefulWidget {
  final Pegawai? pegawai;
  final bool isEdit;

  const PegawaiFormPage({super.key, this.pegawai, this.isEdit = false});

  @override
  State<PegawaiFormPage> createState() => _PegawaiFormPageState();
}

class _PegawaiFormPageState extends State<PegawaiFormPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nipController;
  late TextEditingController _namaController;
  late TextEditingController _tanggalLahirController;
  late TextEditingController _nomorTeleponController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    final p = widget.pegawai;
    _nipController = TextEditingController(
      text: widget.isEdit && p != null ? p.nip : '',
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
    _emailController = TextEditingController(
      text: widget.isEdit && p != null ? p.email : '',
    );
    _passwordController = TextEditingController(
      text: widget.isEdit && p != null ? p.password : '',
    );
  }

  @override
  void dispose() {
    _nipController.dispose();
    _namaController.dispose();
    _tanggalLahirController.dispose();
    _nomorTeleponController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _simpan() {
    if (_formKey.currentState!.validate()) {
      final pegawaiBaru = Pegawai(
        id: widget.isEdit && widget.pegawai != null ? widget.pegawai!.id : null,
        nip: _nipController.text.trim(),
        nama: _namaController.text.trim(),
        tanggalLahir: _tanggalLahirController.text.trim(),
        nomorTelepon: _nomorTeleponController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      Navigator.pop(context, pegawaiBaru);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.isEdit;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Ubah Data Pegawai' : 'Tambah Data Pegawai'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nipController,
              decoration: const InputDecoration(
                labelText: 'NIP',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'NIP wajib diisi';
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
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Email wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password wajib diisi';
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
