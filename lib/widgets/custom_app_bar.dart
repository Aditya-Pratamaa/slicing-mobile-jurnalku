import 'package:flutter/material.dart';
import 'package:slicing_jurnalku/dashboard.dart';
import 'package:slicing_jurnalku/profile.dart';
import 'package:slicing_jurnalku/explore.dart';
import 'package:slicing_jurnalku/permintaan_saksi.dart';
import 'package:slicing_jurnalku/progress_belajar.dart';
import 'package:slicing_jurnalku/catatan_sikap.dart';
import 'package:slicing_jurnalku/panduan_pengguna.dart';
import 'package:slicing_jurnalku/pengaturan_akun.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String nama;
  final String kelas;
  final String? imagePath;
  final VoidCallback? onProfileTap; 

  const CustomAppBar({
    super.key,
    required this.nama,
    required this.kelas,
    this.onProfileTap,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: GestureDetector( 
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
          },
        child: const Icon(Icons.home_outlined, color: Colors.grey)),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      actions: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  nama,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  kelas,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                if (onProfileTap != null) {
                  onProfileTap!();
                } else {
                  // Fallback: jika tidak ada callback, buka drawer dari Scaffold
                  Scaffold.of(context).openDrawer();
                }
              },
              child: CircleAvatar(
                backgroundImage: imagePath != null
                    ? AssetImage(imagePath!) as ImageProvider
                    : const AssetImage('assets/images/profile.jpg'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Method untuk membangun drawer
  static Widget buildDrawer(BuildContext context, String nama, String kelas, String? imagePath) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Header dengan profil
          Container(
            padding: const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nama,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        kelas,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: imagePath != null
                      ? AssetImage(imagePath!) as ImageProvider
                      : const AssetImage('assets/images/profile.jpg'),
                ),
              ],
            ),
          ),

          // Menu Group 1
          _buildMenuItem(
            context,
            icon: Icons.home_outlined,
            title: "Dashboard",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.person_outline,
            title: "Profil",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.explore_outlined,
            title: "Jelajahi",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Explore(textLabel: "Dashboard")));
            },
          ),

          const Divider(),

          // Menu Group 2
          _buildMenuItem(
            context,
            icon: Icons.book_outlined,
            title: "Jurnal Pembiasaan",
            onTap: () {
              Navigator.pop(context);
              
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.person_outlined,
            title: "Permintaan Saksi",
            badge: null,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => PermintaanSaksiPage()));
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.bar_chart_outlined,
            title: "Progress",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProgressBelajar()));
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.warning_amber_outlined,
            title: "Catatan Sikap",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => CatatanSikap()));
            },
          ),

          const Divider(),

          // Menu Group 3
          _buildMenuItem(
            context,
            icon: Icons.menu_book_outlined,
            title: "Panduan Penggunaan",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => PanduanPengguna()));
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.settings_outlined,
            title: "Pengaturan Akun",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => PengaturanAkunPage()));
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.logout_outlined,
            title: "Log Out",
            onTap: () {
              Navigator.pop(context);
              // TODO: Implement logout functionality
            },
          ),
        ],
      ),
    );
  }

  static Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? badge,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
          ),
          if (badge != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                badge,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
      onTap: onTap,
    );
  }

  //  agar bisa digunakan sebagai AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
