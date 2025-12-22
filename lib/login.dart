import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slicing_jurnalku/dashboard.dart';
import 'package:slicing_jurnalku/explore.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;

  Future<void> login() async {
    final username = usernameController.text;
    final password = passwordController.text;

    final url = Uri.parse("http://127.0.0.1:8000/api/login");

    final response = await http.post(
      url,
      body: {"username": username, "password": password},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Login berhasil → pindah ke dashboard
      Navigator.push(context, MaterialPageRoute(builder: (_) => Dashboard()));
    } else {
      // Login gagal → tampilkan error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login gagal! Username atau password salah")),
      );
    }
  }

  List<Map<String, dynamic>> data = [
    {
      'icon': Icons.home,
      'text': 'Dirancang untuk Sekolah Kami',
      'subtext':
          'Dikembangkan khusus untuk memenuhi kebutuhan sekolah kami dengan fokus pada kemajuan siswa kami.',
    },
    {
      'icon': Icons.home,
      'text': 'Pemantauan yang Terstruktur',
      'subtext':
          'Memudahkan guru dalam menyusun dan memantau daftar kompetensi keahlian yang harus dikuasai siswa.',
    },
    {
      'icon': Icons.home,
      'text': 'Fitur Praktis dan Bermanfaat',
      'subtext':
          'Termasuk reminder otomatis, grafik perkembangan, dan analisis mendalam untuk efektivitas belajar.',
    },
    {
      'icon': Icons.home,
      'text': 'Pengajuan Kompetensi oleh Siswa',
      'subtext':
          'Siswa dapat mengajukan kompetensi yang telah dikuasai untuk diverifikasi oleh guru.',
    },
    {
      'icon': Icons.home,
      'text': 'Validasi dan Tanda Tangan Guru',
      'subtext':
          'Setiap kompetensi yang disetujui akan diberikan tanda terima dan tanda tangan guru sebagai bukti.',
    },
    {
      'icon': Icons.home,
      'text': 'Pantauan Real-Time dan Transparan',
      'subtext':
          'Monitoring langsung, menciptakan lingkungan belajar yang efisien.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image(
              image: AssetImage('assets/images/login.png'),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),

            // MAIN CONTENT
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Masuk untuk memulai ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Jurnalku",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 50),

                        // USERNAME
                        Text(
                          "Username atau NIS",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.blue[900]!),
                            ),
                            hintText: "Masukkan username atau NIS",
                          ),
                        ),

                        SizedBox(height: 30),

                        // PASSWORD
                        Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.blue[900]!),
                            ),
                            hintText: "Masukkan password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                        ),

                        SizedBox(height: 30),

                        // BUTTON LOGIN
                        GestureDetector(
                          onTap: () {
                            login(); // panggil function login
                          },
                          child: Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.blue[900],
                            ),
                            child: Center(
                              child: Text(
                                "Masuk",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 50),

                        Center(
                          child: Text(
                            "Lupa password? Hubungi guru laboran.",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),

                        SizedBox(height: 60),

                        Center(
                          child: Text(
                            "Menyatukan Upaya untuk Kemajuan Siswa",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        SizedBox(height: 10),

                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa dalam memantau dan mengelola kompetensi keahlian siswa secara efektif.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),

                        SizedBox(height: 50),

                        Column(
                          children: data.map((item) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 16),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey.shade400),
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Icon(
                                  item['icon'],
                                  color: Colors.blue[900],
                                ),
                                title: Text(
                                  item['text'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(item['subtext']),
                              ),
                            );
                          }).toList(),
                        ),

                        SizedBox(height: 30),
                      ],
                    ),
                  ),

                  // FOOTER BIRU
                  Container(
                    height: 120,
                    width: double.infinity,
                    color: Colors.blue[900],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SOCIAL MEDIA ICONS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.whatsapp,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(width: 25),
                            FaIcon(
                              FontAwesomeIcons.instagram,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(width: 25),
                            FaIcon(
                              FontAwesomeIcons.linkedin,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(width: 25),
                            FaIcon(
                              FontAwesomeIcons.youtube,
                              color: Colors.white,
                              size: 25,
                            ),
                          ],
                        ),

                        SizedBox(height: 12),

                        Text(
                          "© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
