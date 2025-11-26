import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slicing_jurnalku/widgets/custom_app_bar.dart';

class PermintaanSaksiPage extends StatefulWidget {
  const PermintaanSaksiPage({super.key});

  @override
  State<PermintaanSaksiPage> createState() => _PermintaanSaksiPageState();
}

class _PermintaanSaksiPageState extends State<PermintaanSaksiPage> {
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    _setCurrentDate();
  }

  void _setCurrentDate() {
    final now = DateTime.now();
    formattedDate = DateFormat('EEEE, dd MMMM yyyy').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(nama: "Sirojul Kamal", kelas: "PPLG XII-4", imagePath: 'assets/images/profile.jpg'),
      backgroundColor: Colors.white, // 🔹 Warna dasar putih
      body: SafeArea( // 🔹 Lindungi dari area status bar
        child: Container(
          color: Colors.white, // 🔹 Pastikan lapisan utama juga putih
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Baris icon rumah + panah kanan + teks abu
                Row(
                  children: [
                    const Icon(Icons.home_outlined,
                        color: Colors.grey, size: 22),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                      size: 20,
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      "Permintaan Saksi",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // 🔹 Judul + tanggal di kanan
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Permintaan Saksi",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Kelola permintaan menjadi saksi dari siswa lain",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFE8F1FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      child: Text(
                        formattedDate,
                        style: const TextStyle(
                          color: Color(0xFF1E40AF),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // 🔹 Header tabel
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          "PENGIRIM",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "TANGGAL",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "KONFIRMASI",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 🔹 Isi tabel kosong
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.groups_outlined,
                            size: 50,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Belum ada permintaan",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Belum ada yang mengirim permintaan saksi kepada Anda",
                            style: TextStyle(color: Colors.grey.shade600),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}