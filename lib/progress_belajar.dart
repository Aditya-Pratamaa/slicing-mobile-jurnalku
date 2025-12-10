import 'package:flutter/material.dart';
import 'package:slicing_jurnalku/widgets/custom_app_bar.dart';

class ProgressBelajar extends StatefulWidget {
  const ProgressBelajar({super.key});

  @override
  State<ProgressBelajar> createState() => _ProgressBelajarState();
}

class _ProgressBelajarState extends State<ProgressBelajar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final dummyData = [
      {
        'no': '1',
        'kompotensi': 'Kedisiplinan',
        'guru': 'Pak Budi',
        'tanggal': '01 Okt 2025',
        'status': 'Dalam Perbaikan',
        'catatan_guru': 'Sering datang terlambat ke sekolah.',
        'catatan_siswa': 'Sering datang terlambat ke sekolah.'
      },
      {
        'no': '2',
        'kompotensi': 'Kerjasama',
        'guru': 'Bu Rina',
        'status': 'Sudah Berubah',
        'tanggal': '15 Okt 2025',
        'catatan_guru': 'Mulai menunjukkan peningkatan dalam kerja tim.',
        'catatan_siswa': 'Mulai menunjukkan peningkatan dalam kerja tim.'
      },
      {
        'no': '3',
        'kompotensi': 'Tanggung Jawab',
        'guru': 'Pak Joko',
        'tanggal': '20 Okt 2025',
        'status': 'Dalam Perbaikan',
        'catatan_guru': 'Belum mengumpulkan tugas tepat waktu.',
        'catatan_siswa': 'Belum mengumpulkan tugas tepat waktu.'
      },
    ];

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(
        nama: "Aditya Pratama",
        kelas: "PPLG XII-4",
        imagePath: 'assets/images/profile.jpg',
        onProfileTap: () {
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
      drawer: CustomAppBar.buildDrawer(context, "Aditya Pratama", "PPLG XII-4", 'assets/images/profile.jpg'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Progress Belajar",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Pantau perkembangan kompetensi dan materi pembelajaran Anda",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 10),

            // Tanggal
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 200, // contoh diperkecil
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: FittedBox(
                child: Text(
                  "Thursday, 27 November 2025",
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              )
            ),

            const SizedBox(height: 30),

            // Total Catatan
            Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Total Pengajuan",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          dummyData.length.toString(),
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Semua Status", style: TextStyle(color: Colors.blue[900])),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFFBBDEFB),
                      child: Icon(
                        Icons.check,
                        size: 40,
                        color: Color(0xFF0D47A1),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Halaman ini
            Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child:  Padding(
                padding: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Halaman ini",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "0",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text("Semua Status", style: TextStyle(color: Colors.green[900])),
                        
                      ],
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color.fromARGB(255, 214, 214, 213),
                      child: Icon(
                        Icons.show_chart,
                        size: 40,
                        color: Color.fromARGB(255, 0, 230, 81),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Status Pending
            Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: const Padding(
                padding: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Status Pending",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "0",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text("Perlu Validasi", style: TextStyle(color: Colors.orange)),
                      ],
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFFC8E6C9),
                      child: Icon(
                        Icons.access_time_rounded,
                        size: 40,
                        color: Color.fromARGB(255, 231, 145, 6),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Total Halaman
            Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: const Padding(
                padding: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Halaman",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "0",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text("Navigasi Tersedia", style: TextStyle(color: Color.fromARGB(255, 231, 15, 162))),
                      ],
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFFC8E6C9),
                      child: Icon(
                        Icons.scale_outlined,
                        size: 40,
                        color: Color.fromARGB(255, 231, 145, 6),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Tabel Catatan
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: dummyData.length,
              itemBuilder: (context, index) {
                final item = dummyData[index];
                return ExpansionTile(
                  title: Text("Projek Work", style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text("Kompetensi dan materi pembelajaran"),
                  children: [
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRow("Kompetensi", item['kompotensi']),
        _buildRow("Guru", item['guru']),
        _buildRow("Tanggal", item['tanggal']),
        _buildRow("Status", item['status']),
        const SizedBox(height: 10),

        const Text("Catatan Guru:",
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text(item['catatan_guru'].toString()),

        const SizedBox(height: 10),

        const Text("Catatan Siswa:",
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text(item['catatan_siswa'].toString()),
      ],
    ),
  )
],

                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String title, String? value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$title:"),
        Text(value ?? "-",
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

}
