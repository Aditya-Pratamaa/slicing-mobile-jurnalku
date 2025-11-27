import 'dart:ui';

import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<Map<String, dynamic>> students = [
    {
      'image': 'assets/images/profile.jpg',
      'name': 'Arya Stark',
      'nis': '123456',
      'rombel': 'PPLG XI-4',
      'rayon': 'Cibedug 2',
      'jumlah_portfolio': 5,
      'jumlah_sertifikat': 3,
    },
    {
      'image': 'assets/images/profile.jpg',
      'name': 'Bran Snow',
      'nis': '123457',
      'rombel': 'PPLG XI-2',
      'rayon': 'Cicurug 1',
      'jumlah_portfolio': 4,
      'jumlah_sertifikat': 2,
    },
    {
      'image': 'assets/images/profile.jpg',
      'name': 'Sansa Putri',
      'nis': '123458',
      'rombel': 'PPLG XI-1',
      'rayon': 'Ciawi 3',
      'jumlah_portfolio': 6,
      'jumlah_sertifikat': 4,
    },
    {
      'image': 'assets/images/profile.jpg',
      'name': 'Jon Aditya',
      'nis': '123459',
      'rombel': 'PPLG XI-3',
      'rayon': 'Tajur 1',
      'jumlah_portfolio': 3,
      'jumlah_sertifikat': 1,
    },
    {
      'image': 'assets/images/profile.jpg',
      'name': 'Tyrion Ramadhan',
      'nis': '123460',
      'rombel': 'PPLG XI-5',
      'rayon': 'Sukasari 2',
      'jumlah_portfolio': 8,
      'jumlah_sertifikat': 3,
    },
    {
      'image': 'assets/images/profile.jpg',
      'name': 'Daenerys Cahya',
      'nis': '123461',
      'rombel': 'PPLG XI-2',
      'rayon': 'Sindangbarang 3',
      'jumlah_portfolio': 7,
      'jumlah_sertifikat': 5,
    },
    {
      'image': 'assets/images/profile.jpg',
      'name': 'Robb Firmansyah',
      'nis': '123462',
      'rombel': 'PPLG XI-1',
      'rayon': 'Wikrama 1',
      'jumlah_portfolio': 2,
      'jumlah_sertifikat': 2,
    },
    {
      'image': 'assets/images/profile.jpg',
      'name': 'Joffrey Ardi',
      'nis': '123463',
      'rombel': 'PPLG XI-4',
      'rayon': 'Cisarua 4',
      'jumlah_portfolio': 4,
      'jumlah_sertifikat': 1,
    },
    {
      'image': 'assets/images/profile.jpg',
      'name': 'Samwell Nugraha',
      'nis': '123464',
      'rombel': 'PPLG XI-5',
      'rayon': 'Cibedug 1',
      'jumlah_portfolio': 10,
      'jumlah_sertifikat': 6,
    },
    {
      'image': 'assets/images/profile.jpg',
      'name': 'Theon Baskara',
      'nis': '123465',
      'rombel': 'PPLG XI-3',
      'rayon': 'Cigombong 2',
      'jumlah_portfolio': 3,
      'jumlah_sertifikat': 2,
    },
    {
      'image': 'assets/images/profile.jpg',
      'name': 'Gendry Salman',
      'nis': '123466',
      'rombel': 'PPLG XI-4',
      'rayon': 'Ciawi 2',
      'jumlah_portfolio': 5,
      'jumlah_sertifikat': 3,
    },
    {
      'image': 'assets/images/profile.jpg',
      'name': 'Podrick Fadillah',
      'nis': '123467',
      'rombel': 'PPLG XI-1',
      'rayon': 'Cisarua 2',
      'jumlah_portfolio': 1,
      'jumlah_sertifikat': 1,
    },
    {
      'image': 'assets/images/profile.jpg',
      'name': 'Hodor Saputra',
      'nis': '123468',
      'rombel': 'PPLG XI-2',
      'rayon': 'Cibedug 3',
      'jumlah_portfolio': 2,
      'jumlah_sertifikat': 0,
    },
    {
      'image': 'assets/images/profile.jpg',
      'name': 'Missandei Zahra',
      'nis': '123469',
      'rombel': 'PPLG XI-5',
      'rayon': 'Tajur 3',
      'jumlah_portfolio': 6,
      'jumlah_sertifikat': 4,
    },
    {
      'image': 'assets/images/profile.jpg',
      'name': 'Greyjoy Putra',
      'nis': '123470',
      'rombel': 'PPLG XI-3',
      'rayon': 'Ciomas 1',
      'jumlah_portfolio': 4,
      'jumlah_sertifikat': 2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        surfaceTintColor: Colors.grey[100],
        backgroundColor: Colors.grey[100],
        title: Row(
          children: [
            Icon(Icons.menu_book_outlined, color: Colors.blue.shade900),
            SizedBox(width: 10),
            Text("Jurnalku", style: TextStyle(color: Colors.blue.shade900)),
          ],
        ),
        actions: [
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(right: 10),
              child: Text(
                "Dashboard",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER
            Stack(
              children: [
                Image(
                  image: AssetImage('assets/images/login.png'),
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(color: Colors.black.withOpacity(0.1)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(color: Colors.blue[900]!),
                            child: Text(
                              "Direktori",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Siswa",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Temukan dan jelajahi profil siswa SMK Wikrama Bogor",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),

                      SizedBox(height: 20),

                      Container(
                        alignment: Alignment.center,
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 15,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: "Cari nama...",
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: Colors.grey,
                                        ),
                                        hintStyle: TextStyle(
                                          color: Colors.grey[400],
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blue[900]!,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Colors.blue[900],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      "Cari",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 10),
                              Center(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.filter_alt,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          "Filter Lanjutan",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.grey,
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
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // CONTENT
            Padding(
              padding: EdgeInsetsGeometry.all(17),
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Menampilkan 1 - 12 dari 538 siswa",
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 20),
                    ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10);
                      },
                      shrinkWrap: true,
                      itemCount: 12,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final student = students[index];

                        return Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // FOTO
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  student['image'],
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              SizedBox(height: 12),

                              // DATA
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // NAMA
                                  Text(
                                    student['name'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),

                                  SizedBox(height: 4),

                                  // NIS | ROMBEL | RAYON
                                  Text(
                                    "${student['nis']} | ${student['rombel']} | ${student['rayon']}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),

                                  SizedBox(height: 10),

                                  Divider( color: Colors.grey),

                                  SizedBox(height: 10),

                                  // PORTFOLIO & SERTIFIKAT
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.folder,
                                            size: 16,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            "${student['jumlah_portfolio']} Portfolio",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),

                                      SizedBox(width: 15),

                                      Row(
                                        children: [
                                          Icon(
                                            Icons.badge,
                                            size: 16,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            "${student['jumlah_sertifikat']} Sertifikat",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 12),

                                  // BUTTON
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue[900],
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 4),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Lihat Detail", style: TextStyle(color: Colors.white),),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
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
          ],
        ),
      ),
    );
  }
}
