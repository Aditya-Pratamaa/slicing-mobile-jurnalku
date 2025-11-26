import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String nama;
  final String kelas;
  final String? imagePath;

  const CustomAppBar({
    super.key,
    required this.nama,
    required this.kelas,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Icon(Icons.home_outlined, color: Colors.grey),
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
            CircleAvatar(
              backgroundImage: imagePath != null
                  ? AssetImage(imagePath!) as ImageProvider
                  : const AssetImage('assets/images/profile.jpg'),
            ),
          ],
        ),
      ],
    );
  }

  //  agar bisa digunakan sebagai AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
