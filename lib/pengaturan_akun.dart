import 'package:flutter/material.dart';

class PengaturanAkunPage extends StatelessWidget {
  const PengaturanAkunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F7),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Pengaturan Akun",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: const [
                        Text(
                          "Dashboard / ",
                          style: TextStyle(color: Colors.black87),
                        ),
                        Text(
                          "Pengaturan Akun",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // ---------------------
                // CARD 1 – INFORMASI PROFIL
                // ---------------------
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Informasi Profil",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // FOTO + DATA
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // FOTO PROFIL
                          Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 110,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 4,
                                      ),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                          "assets/images/profile.jpg",
                                         
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                                  // TOMBOL KAMERA
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      height: 32,
                                      width: 32,
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 36, 39, 119),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                "Klik untuk mengubah foto",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(width: 25),

                          // KOLOM FORM PROFIL
                          Expanded(
                            child: Column(
                              children: [
                                buildDisabledInput("Nama", "Sirojul Kamal"),
                                buildDisabledInput("NIS", "12310054"),
                                buildDisabledInput("Rombel", "PPLG XII-4"),
                                buildDisabledInput("Rayon", "Cis 2"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // ---------------------
                // CARD 2 – UBAH PASSWORD
                // ---------------------
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ubah Kata Sandi",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      buildPasswordField("Kata Sandi Lama"),
                      const SizedBox(height: 15),
                      buildPasswordField("Kata Sandi Baru"),

                      const SizedBox(height: 25),

                      // TOMBOL SIMPAN
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 46, 72, 116),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 14,
                          ),
                        ),
                        child: const Text(
                          "Simpan Perubahan",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDisabledInput(String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,   
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          enabled: false,
          decoration: InputDecoration(
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
            hintText: value,
            hintStyle: const TextStyle(
              color: Colors.black, // 🔹 teks value juga hitam
            ),
          ),
        ),
      ],
    ),
  );
}


  // FIELD PASSWORD
  Widget buildPasswordField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.visibility_off),
            filled: true,
            fillColor: const Color(0xFFF1F5F9),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            hintText: "Masukkan password",
          ),
        ),
      ],
    );
  }
}