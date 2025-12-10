import 'package:flutter/material.dart';
import 'package:slicing_jurnalku/widgets/custom_app_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[100],
      appBar: CustomAppBar(
        nama: "Aditya",
        kelas: "PPLG XII-4",
        imagePath: 'assets/images/profile.jpg',
        onProfileTap: () {
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
      drawer: CustomAppBar.buildDrawer(
        context,
        "Aditya",
        "PPLG XII-4",
        'assets/images/profile.jpg',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderSection(),
            const SizedBox(height: 20),
            _buildInfoCard(
              color: Colors.blueAccent[400],
              title: "Apa itu Jurnalku?",
              text: "Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa dalam memantau dan mengelola kompetensi keahlian siswa secara efektif, terstruktur, dan real-time.",
              textColor: Colors.white,
            ),
            const SizedBox(height: 30),
            _buildFeatureCard(
              icon: Icons.school,
              title: "Dirancang khusus",
              description: "Memenuhi kebutuhan spesifik sekolah kami dengan fokus pada kemajuan siswa.",
            ),
            const SizedBox(height: 30),
            _buildFeatureCard(
              icon: Icons.grade,
              title: "Efektif",
              description: "Memudahkan siswa dan guru melihat perkembangan secara real-time.",
            ),
            const SizedBox(height: 30),
            _buildFeatureCard(
              icon: Icons.edit_note,
              title: "Terintegrasi",
              description: "Pengajuan kompetensi siswa, validasi dan laporan perkembangan yang transparan.",
            ),
            const SizedBox(height: 30),
            _buildMenuSection(),
            const SizedBox(height: 30),
            _buildStatisticsSection(),
            const SizedBox(height: 30),
            _buildProgressAcademicCard(),
            const SizedBox(height: 20),
            _buildProgressViewCard(),
            const SizedBox(height: 30),
            _buildFooter(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF1565C0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Selamat Datang di Jurnalku!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Solusi cerdas untuk memantau perkembangan kompetensi siswa secara efektif",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required Color? color,
    required String title,
    required String text,
    Color textColor = Colors.white,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              text,
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: textColor.withOpacity(0.9),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: Colors.blue[900],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "MENU APLIKASI",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          _buildMenuCard([
            _buildMenuItem(
              Icons.person_outline,
              "Profil",
              "Lihat dan kelola profilmu di sini.",
            ),
            _buildMenuItem(
              Icons.folder_open,
              "Portofolio",
              "Lihat dan kelola portofolio kompetensimu di sini.",
            ),
            _buildMenuItem(
              Icons.workspace_premium,
              "Sertifikat",
              "Lihat dan unduh sertifikat kompetensimu di sini.",
            ),
          ]),
          const SizedBox(height: 16),
          _buildMenuCard([
            _buildMenuItem(
              Icons.book_outlined,
              "Jurnal Pembiasaan",
              "Catat dan pantau kegiatan pembiasaan harianmu.",
            ),
            _buildMenuItem(
              Icons.people_outline,
              "Permintaan Saksi",
              "Lihat teman yang mengajukan permintaan saksi.",
            ),
            _buildMenuItem(
              Icons.trending_up_outlined,
              "Progress",
              "Pantau perkembangan kompetensimu di sini.",
            ),
            _buildMenuItem(
              Icons.warning_amber_outlined,
              "Catatan Sikap",
              "Lihat catatan sikap dan perilaku dari guru.",
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildMenuCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String subtitle) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.blue[700], size: 24),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey[400],
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 4),
        ),
        if (title != "Catatan Sikap" && title != "Sertifikat")
          Divider(height: 1, color: Colors.grey[200]),
      ],
    );
  }

  Widget _buildStatisticsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "STATISTIK KOMPETENSI",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 16),
          _buildStatCard(
            title: "Materi Diselesaikan",
            value: "0",
            valueColor: Colors.green,
            label: "Selesai",
            labelColor: Colors.green,
            icon: Icons.check_circle,
            iconBg: Colors.green.withOpacity(0.15),
            iconColor: Colors.green,
          ),
          const SizedBox(height: 12),
          _buildStatCard(
            title: "Pengajuan Pending",
            value: "0",
            valueColor: Colors.orange,
            label: "Pending",
            labelColor: Colors.orange,
            icon: Icons.access_time,
            iconBg: Colors.orange.withOpacity(0.15),
            iconColor: Colors.orange,
          ),
          const SizedBox(height: 12),
          _buildStatCard(
            title: "Materi Hari Ini",
            value: "0",
            valueColor: Colors.blue,
            label: "Hari Ini",
            labelColor: Colors.blue,
            icon: Icons.calendar_today,
            iconBg: Colors.blue.withOpacity(0.15),
            iconColor: Colors.blue,
          ),
          const SizedBox(height: 12),
          _buildStatCard(
            title: "Materi Revisi",
            value: "0",
            valueColor: Colors.purple,
            label: "Revisi",
            labelColor: Colors.purple,
            icon: Icons.refresh,
            iconBg: Colors.purple.withOpacity(0.15),
            iconColor: Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required Color valueColor,
    required String label,
    required Color labelColor,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: valueColor,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.circle, size: 8, color: labelColor),
                    const SizedBox(width: 6),
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 13,
                        color: labelColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconBg,
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressAcademicCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Progress Akademik",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _buildProgressItem("Selesai", Colors.blue, "0"),
            const SizedBox(height: 12),
            _buildProgressItem("Pending", Colors.purple, "0"),
            const SizedBox(height: 12),
            _buildProgressItem("Belum", Colors.blueAccent, "0"),
            const SizedBox(height: 12),
            _buildProgressItem("Hari Ini", Colors.teal, "0"),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressItem(String label, Color color, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.circle, size: 10, color: color),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressViewCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Lihat Progress Kamu",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[800],
                  ),
                ),
                const SizedBox(width: 6),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.blue[800],
                  size: 20,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              "Belum ada kompetensi / progress",
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue[600],
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  "Lihat semua Kompetensi",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 6),
                Icon(
                  Icons.arrow_forward,
                  size: 18,
                  color: Colors.grey[600],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Center(
      child: Text(
        "© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}