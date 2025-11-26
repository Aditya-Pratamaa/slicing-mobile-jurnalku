import 'package:flutter/material.dart';
import 'package:slicing_jurnalku/catatan_sikap.dart';
import 'package:slicing_jurnalku/login.dart';
import 'package:slicing_jurnalku/panduan_pengguna.dart';
import 'package:slicing_jurnalku/pengaturan_akun.dart';
import 'package:slicing_jurnalku/permintaan_saksi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}