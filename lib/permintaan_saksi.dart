import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:slicing_jurnalku/widgets/custom_app_bar.dart';

class PermintaanSaksiPage extends StatefulWidget {
  const PermintaanSaksiPage({super.key});

  @override
  State<PermintaanSaksiPage> createState() => _PermintaanSaksiPageState();
}

class _PermintaanSaksiPageState extends State<PermintaanSaksiPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String formattedDate = "";

  // 🔹 Dummy data contoh
  final List<Map<String, String>> dummyData = [
    {
      "pengirim": "Rizky Maulana",
      "tanggal": "10 Januari 2025",
      "kegiatan": "Membersihkan kelas setelah jam pelajaran selesai.",
      "catatan": "Butuh verifikasi sebagai saksi ya kak 🙏"
    },
    {
      "pengirim": "Alya Rahma",
      "tanggal": "09 Januari 2025",
      "kegiatan": "Mengikuti kegiatan pramuka dan mencatat laporan harian.",
      "catatan": "Mohon bantuannya kak!"
    },
  ];

  @override
  void initState() {
    super.initState();

    // 🔹 Load locale data 'id_ID' biar DateFormat tidak error
    initializeDateFormatting('id_ID', null).then((_) {
      _setCurrentDate();
      setState(() {});
    });
  }

  void _setCurrentDate() {
    final now = DateTime.now();
    formattedDate = DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        nama: "Sirojul Kamal",
        kelas: "PPLG XII-4",
        imagePath: 'assets/images/profile.jpg',
        onProfileTap: () {
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
      drawer: CustomAppBar.buildDrawer(context, "Sirojul Kamal", "PPLG XII-4", 'assets/images/profile.jpg'),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // 🔹 Judul
              const Text(
                "Permintaan Saksi",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                "Kelola permintaan menjadi saksi dari siswa lain",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),

              const SizedBox(height: 12),

              // 🔹 Tanggal
              if (formattedDate.isNotEmpty)
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

              const SizedBox(height: 30),

              // ================================
              //   🔥 LIST PERMINTAAN SAKSI
              // ================================
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dummyData.length,
                itemBuilder: (context, index) {
                  final item = dummyData[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: ExpansionTile(
                      tilePadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      childrenPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      title: Text(
                        item["pengirim"] ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        item["tanggal"] ?? "",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      children: [
                        const SizedBox(height: 10),

                        // 🔹 Kegiatan
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Kegiatan: ",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Expanded(
                              child: Text(item["kegiatan"] ?? ""),
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        // 🔹 Catatan
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Catatan: ",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Expanded(
                              child: Text(item["catatan"] ?? ""),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // 🔹 Tombol aksi
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Tolak",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1E40AF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text("Terima"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
