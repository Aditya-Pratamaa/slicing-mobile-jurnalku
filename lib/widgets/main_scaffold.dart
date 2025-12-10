import 'package:flutter/material.dart';
import 'package:slicing_jurnalku/widgets/custom_app_bar.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;
  final String nama;
  final String kelas;
  final String? imagePath;

  MainScaffold({
    super.key,
    required this.body,
    required this.nama,
    required this.kelas,
    this.imagePath,
  });

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      appBar: CustomAppBar(
        nama: nama,
        kelas: kelas,
        imagePath: imagePath,
        onProfileTap: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),

      drawer: _buildDrawer(context),

      body: body,
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(nama),
            accountEmail: Text(kelas),
            currentAccountPicture: CircleAvatar(
              backgroundImage: imagePath != null
                  ? AssetImage(imagePath!)
                  : AssetImage("assets/images/profile.jpg"),
            ),
          ),

          ListTile(
            leading: Icon(Icons.home),
            title: Text("Dashboard"),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profil"),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.book),
            title: Text("Jurnal Pembiasaan"),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.verified_user),
            title: Row(
              children: [
                Text("Permintaan Saksi"),
                SizedBox(width: 8),
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.blue,
                  child: Text("2", style: TextStyle(fontSize: 12, color: Colors.white)),
                )
              ],
            ),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text("Progress"),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.assignment_outlined),
            title: Text("Catatan Sikap"),
            onTap: () {},
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.menu_book),
            title: Text("Panduan Pengguna"),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Pengaturan Akun"),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Log Out"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
