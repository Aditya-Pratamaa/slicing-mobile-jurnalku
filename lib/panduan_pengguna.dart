import 'package:flutter/material.dart';
import 'package:slicing_jurnalku/widgets/custom_app_bar.dart';

class PanduanPengguna extends StatefulWidget {
  const PanduanPengguna({super.key});

  @override
  State<PanduanPengguna> createState() => _PanduanPenggunaState();
}

class _PanduanPenggunaState extends State<PanduanPengguna> {
  final List<Map<String, dynamic>> umumList = [
    {
      "title": "Unggah Profile",
      "description": "Panduan untuk mengunggah profile pengguna",
      "icon": Icons.library_books,
    },
    {
      "title": "Ganti Password",
      "description": "Panduan untuk mengganti password pengguna",
      "icon": Icons.library_books,
    },
  ];

  final List<Map<String, dynamic>> siswaList = [
    {
      "title": "Mengisi Jurnal",
      "description": "Panduan untuk mengisi kegiatan sehari-hari",
      "icon": Icons.library_books,
    },
    {
      "title": "Kelengkapan Profile",
      "description": "Panduan untuk melengkapi profile",
      "icon": Icons.library_books,
    },
    {
      "title": "Mengelola Portfolio",
      "description": "Panduan untuk menambah, edit, dan menghapus portfolio",
      "icon": Icons.image,
    },
    {
      "title": "Mengelola Sertifikat",
      "description": "Panduan untuk menambah, edit, dan menghapus sertifikat",
      "icon": Icons.verified,
    },
    {
      "title": "Catatan Sikap Saya",
      "description": "Panduan untuk melihat dan memahami catatan sikap",
      "icon": Icons.info_outlined,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(nama: "Aditya Pratama", kelas: "PPLG XII-4", imagePath: 'assets/images/profile.jpg'),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.menu_book_sharp,
                    size: 40,
                    color: Colors.blue[900],
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Panduan Penggunaan",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Selamat datang di panduan penggunaan aplikasi Jurnalku. Panduan ini akan membantu Anda memahami cara menggunakan fitur-fitur yang tersedia dengan optimal.",
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              SizedBox(height: 25),
              Text(
                "Umum",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Divider(),
              SizedBox(height: 10),
              ...umumList.map(
                (item) => Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 235, 249, 255),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(item['icon'], color: Colors.blue[800]),
                      ),
                      title: Text(
                        item['title'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        item['description'],
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Untuk Siswa",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Divider(),
              SizedBox(height: 10),
              ...siswaList.map(
                (item) => Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 235, 249, 255),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(item['icon'], color: Colors.blue[800]),
                      ),
                      title: Text(
                        item['title'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        item['description'],
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
