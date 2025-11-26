import 'package:flutter/material.dart';
import 'package:slicing_jurnalku/widgets/custom_app_bar.dart';

class CatatanSikap extends StatefulWidget {
  const CatatanSikap({super.key});

  @override
  State<CatatanSikap> createState() => _CatatanSikapState();
}

class _CatatanSikapState extends State<CatatanSikap> {
  final List<Map<String, String>> dummyData = [
    {
      'no': '1',
      'kategori': 'Kedisiplinan',
      'catatan': 'Sering datang terlambat ke sekolah.',
      'status': 'Dalam Perbaikan',
      'dilaporkan': 'Pak Budi',
      'update': '01 Okt 2025',
      'aksi': '-'
    },
    {
      'no': '2',
      'kategori': 'Kerjasama',
      'catatan': 'Mulai menunjukkan peningkatan dalam kerja tim.',
      'status': 'Sudah Berubah',
      'dilaporkan': 'Bu Rina',
      'update': '15 Okt 2025',
      'aksi': '-'
    },
    {
      'no': '3',
      'kategori': 'Tanggung Jawab',
      'catatan': 'Belum mengumpulkan tugas tepat waktu.',
      'status': 'Dalam Perbaikan',
      'dilaporkan': 'Pak Joko',
      'update': '20 Okt 2025',
      'aksi': '-'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const CustomAppBar(
        nama: "Aditya Pratama",
        kelas: "PPLG XII-4",
        imagePath: 'assets/images/profile.jpg',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Catatan Sikap Saya",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Lihat catatan sikap dan perilaku yang telah dilaporkan",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 35),

            // Card Perhatian
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 238, 227, 210),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Icon(
                        Icons.info_outline_rounded,
                        size: 30,
                        color: Colors.orange.shade400,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Perhatian",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 167, 103, 8),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Jika Anda merasa ada catatan yang tidak sesuai atau keliru, silakan hubungi guru jurusan untuk mengajukan klarifikasi.",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 201, 139, 46),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Total Catatan
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey.shade400,
                ),
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
                          "Total Catatan",
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
                      ],
                    ),
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFFBBDEFB),
                      child: Icon(
                        Icons.book_outlined,
                        size: 40,
                        color: Color(0xFF0D47A1),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Dalam Perbaikan
            Container(
              height: 150,
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
                          "Dalam Perbaikan",
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
                      ],
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFFFFF59D),
                      child: Icon(
                        Icons.electric_bolt_sharp,
                        size: 40,
                        color: Color(0xFFE65100),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Sudah Berubah
            Container(
              height: 150,
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
                          "Sudah Berubah",
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
                      ],
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFFC8E6C9),
                      child: Icon(
                        Icons.verified_outlined,
                        size: 40,
                        color: Color(0xFF1B5E20),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Tabel Catatan
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  if (dummyData.isNotEmpty) ...[
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width,
                        ),
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('NO')),
                            DataColumn(label: Text('KATEGORI')),
                            DataColumn(label: Text('CATATAN')),
                            DataColumn(label: Text('STATUS')),
                            DataColumn(label: Text('DILAPORKAN')),
                            DataColumn(label: Text('UPDATE TERAKHIR')),
                            DataColumn(label: Text('AKSI')),
                          ],
                          rows: dummyData
                              .map(
                                (item) => DataRow(
                                  cells: [
                                    DataCell(Text(item['no']!)),
                                    DataCell(Text(item['kategori']!)),
                                    DataCell(Text(item['catatan']!)),
                                    DataCell(Text(item['status']!)),
                                    DataCell(Text(item['dilaporkan']!)),
                                    DataCell(Text(item['update']!)),
                                    DataCell(Text(item['aksi']!)),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ] else ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        children: [
                          Icon(Icons.check_circle_outline,
                              color: Colors.grey, size: 50),
                          SizedBox(height: 10),
                          Text(
                            "Tidak ada catatan",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Belum ada catatan sikap yang ditambahkan",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
