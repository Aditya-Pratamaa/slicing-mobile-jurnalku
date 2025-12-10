import 'package:flutter/material.dart';
import 'package:slicing_jurnalku/widgets/custom_app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.grey[100],
        appBar: CustomAppBar(
          nama: "Aditya",
          kelas: "PPLG XII-4",
          onProfileTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        drawer: CustomAppBar.buildDrawer(context, "Aditya", "PPLG XII-4", null),
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/profile.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -50,
                  left: 24,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.red,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Fernanda Ziyad",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "1230965G | PPLG XII-4 | Taj 5",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              color: Colors.white,
              child: const TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.blue,
                indicatorWeight: 3,
                tabs: [
                  Tab(text: "Overview"),
                  Tab(text: "Portfolio"),
                  Tab(text: "Sertifikat"),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  OverviewPage(),
                  PortfolioPage(),
                  SertifikatPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Portofolio Baru",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      Text("Lihat Semua", style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                  SizedBox(height: 12),
                  Divider(),
                  SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        Icon(Icons.work_outline, size: 30, color: Colors.grey),
                        SizedBox(height: 10),
                        Text(
                          "Portofolio akan ditampilkan di sini",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sertifikat Baru",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      Text("Lihat Semua", style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                  SizedBox(height: 12),
                  Divider(),
                  SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        Icon(Icons.workspace_premium, size: 30, color: Colors.grey),
                        SizedBox(height: 10),
                        Text(
                          "Sertifikat akan ditampilkan di sini",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: Container(
              padding: const EdgeInsets.only(left: 20, top: 16),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Dokumen", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Curiculum Vitae",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                      const Text("Dokumen CV Siswa", style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, bottom: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                                child: const Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.build, color: Colors.white),
                                      SizedBox(width: 10),
                                      Text("Lihat CV", style: TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            const Icon(Icons.download),
                          ],
                        ),
                      ),
                      const Divider(height: 1),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Kartu Pelajar",
                            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600, letterSpacing: 1),
                          ),
                          const Text("Kartu Identitas Siswa", style: TextStyle(color: Colors.grey)),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: null,
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.warning),
                                      SizedBox(width: 10),
                                      Text("Belum Mengupload Kartu Pelajar"),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              const Icon(Icons.download),
                              const SizedBox(width: 20),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Media Sosial",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.edit_outlined, size: 18),
                        label: const Text("Edit"),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          side: BorderSide(color: Colors.grey.shade300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(Icons.link, color: Colors.grey.shade600, size: 20),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Instagram",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 5),
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                "-",
                                style: TextStyle(color: Colors.blue, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.open_in_new, color: Colors.grey.shade400, size: 18),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(Icons.link, color: Colors.grey.shade600, size: 20),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "LinkedIn",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 5),
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                "-",
                                style: TextStyle(color: Colors.blue, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.open_in_new, color: Colors.grey.shade400, size: 18),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Portfolio Terbaru",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text("Tambah"),
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Lihat Semua"),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Center(
                child: Column(
                  children: [
                    Icon(Icons.work_outline, size: 30, color: Colors.brown),
                    SizedBox(height: 12),
                    Text(
                      "Portfolio akan ditampilkan di sini",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SertifikatPage extends StatelessWidget {
  const SertifikatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          "Ini halaman Sertifikat",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}