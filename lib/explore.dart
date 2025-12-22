import 'dart:ui';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:slicing_jurnalku/dashboard.dart';
import 'package:slicing_jurnalku/login.dart';

class Explore extends StatefulWidget {
  final String textLabel;
  const Explore({super.key, required this.textLabel});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<Map<String, dynamic>> students = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final response = await http.get(
        Uri.parse('http://localhost:8000/api/students'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          students = data.map((student) {
            return {
              'id': student['id'],
              'name': student['name'] ?? '',
              'nis': student['nis'] ?? '',
              'rombel': student['rombel'] ?? '',
              'photo_profile': student['photo_profile'] ?? '',
              'grade': student['grade'] ?? '',
            };
          }).toList();
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Gagal memuat data: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
        isLoading = false;
      });
    }
  }

  String getImageUrl(String? photoProfile) {
    if (photoProfile == null || photoProfile.isEmpty) {
      return 'assets/images/profile.jpg';
    }
    // Construct full URL for the image
    return 'http://localhost:8000/storage/$photoProfile';
  }

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
            onTap: () {
              if (widget.textLabel == "Login") {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
              }
            },
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
                widget.textLabel,
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
                      isLoading
                          ? "Memuat data..."
                          : "Menampilkan 1 - ${students.length} dari ${students.length} siswa",
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 20),
                    if (isLoading)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    else if (errorMessage != null)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text(
                                errorMessage!,
                                style: TextStyle(color: Colors.red),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: fetchStudents,
                                child: Text('Coba Lagi'),
                              ),
                            ],
                          ),
                        ),
                      )
                    else if (students.isEmpty)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text('Tidak ada data siswa'),
                        ),
                      )
                    else
                      ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10);
                        },
                        shrinkWrap: true,
                        itemCount: students.length,
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
                                child: student['photo_profile'] != null &&
                                        student['photo_profile'].toString().isNotEmpty
                                    ? Image.network(
                                        getImageUrl(student['photo_profile']),
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Image.asset(
                                            'assets/images/profile.jpg',
                                            width: 60,
                                            height: 60,
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      )
                                    : Image.asset(
                                        'assets/images/profile.jpg',
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

                                  // NIS | ROMBEL
                                  Text(
                                    "${student['nis']} | ${student['rombel']}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),

                                  SizedBox(height: 10),

                                  Divider( color: Colors.grey),

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
