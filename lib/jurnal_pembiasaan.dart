import 'package:flutter/material.dart';
import 'package:slicing_jurnalku/widgets/custom_app_bar.dart';

class JurnalPembiasaanPage extends StatefulWidget {
  
  const JurnalPembiasaanPage({super.key});

  @override
  State<JurnalPembiasaanPage> createState() => _JurnalPembiasaanPageState();
}

class _JurnalPembiasaanPageState extends State<JurnalPembiasaanPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        nama: "Aditya",
        kelas: "PPLG XII-4",
        onProfileTap: () {
          _scaffoldKey.currentState?.openEndDrawer();
        },
        imagePath: "assets/images/profile.jpg",
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            const SizedBox(height: 24),
            _pembiasaanHarian(),
            const SizedBox(height: 32),
            _pekerjaanDilakukan(),
            const SizedBox(height: 32),
            _materiDipelajari(),
            const SizedBox(height: 32),
            _bagianPoin(), 
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Jurnal Pembiasaan",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "NOVEMBER - 2025",
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 16),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade700,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
          label: const Text("Bulan Sebelumnya"),
        ),
      ],
    );
  }

  Widget _pembiasaanHarian() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "A. Pembiasaan harian",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),

        Row(
          children: [
            _legendItem(Colors.green, "Sudah diisi"),
            const SizedBox(width: 12),
            _legendItem(Colors.grey, "Belum diisi"),
            const SizedBox(width: 12),
            _legendItem(Colors.red, "Tidak diisi"),
          ],
        ),

        const SizedBox(height: 16),
        _calendarGrid(),
      ],
    );
  }

  Widget _legendItem(Color color, String text) {
    return Row(
      children: [
        Icon(Icons.circle, color: color, size: 12),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 13)),
      ],
    );
  }

  Widget _calendarGrid() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1.1,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
      ),
      itemCount: 30,
      itemBuilder: (context, index) {
        final day = index + 1;

        bool isFilled = [1, 3, 10, 12].contains(day);
        bool isNotFilled = [4, 6, 7, 14, 18, 20, 21].contains(day);

        return Container(
          decoration: BoxDecoration(
            color: isFilled
                ? Colors.green.shade100
                : isNotFilled
                    ? Colors.red.shade100
                    : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            day.toString().padLeft(2, '0'),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isNotFilled ? Colors.red : Colors.black87,
            ),
          ),
        );
      },
    );
  }

  Widget _pekerjaanDilakukan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "B. Pekerjaan yang dilakukan",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),

        _tableWrapper(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _tableHeader(["Pekerjaan", "Tgl", "Saksi"]),
              _tableEmpty("Belum ada pekerjaan yang diinput."),
              _tableAddButton("+ Tambah Pekerjaan"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _materiDipelajari() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "C. Materi yang dipelajari",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),

        _tableWrapper(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _tableHeader(["Materi", "Sts", "Tgl"]),
              _tableEmpty("Belum ada materi yang diinput."),
              _tableAddButton("+ Tambah Materi"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _tableWrapper({required Widget child}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: child,
    );
  }

  Widget _tableHeader(List<String> columns) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        children: [
          Expanded(child: Text(columns[0], style: const TextStyle(fontWeight: FontWeight.w600))),
          SizedBox(width: 70, child: Text(columns[1], textAlign: TextAlign.center)),
          SizedBox(width: 70, child: Text(columns[2], textAlign: TextAlign.center)),
        ],
      ),
    );
  }

  Widget _tableEmpty(String message) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Text(
        message,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget _tableAddButton(String label) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.blue.shade700,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _bagianPoin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "D. Poin",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),

        _tableWrapper(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _poinMainHeader(),
              _poinSubHeader(),

              _poinRow(
                "(5) mengerjakan project/adanya update progress belajar",
                ["0", "0", "0", "0"],
              ),

              _poinRow(
                "(1 - 5) poin dari pertanyaan atau laporan pengetahuan materi",
                ["0", "0", "0", "0"],
              ),

              _poinRow(
                "Jumlah poin minggu ini",
                ["0", "0", "0", "0"],
              ),

              _poinRowSingle(
                "Jumlah poin ceklist pembiasaan",
                "0",
              ),

              _poinRowSingle(
                "Jumlah keseluruhan poin",
                "0",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _poinMainHeader() {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          Expanded(
            child: const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                "Kategori Poin",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(
            width: 200,
            padding: const EdgeInsets.all(12),
            alignment: Alignment.center,
            child: const Text(
              "Jumlah Poin",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _poinSubHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          Expanded(child: Container()),
          _poinHeaderCell("M1"),
          _poinHeaderCell("M2"),
          _poinHeaderCell("M3"),
          _poinHeaderCell("M4"),
        ],
      ),
    );
  }

  Widget _poinHeaderCell(String text) {
    return Container(
      width: 50,
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _poinRow(String kategori, List<String> values) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(kategori),
            ),
          ),
          ...values.map(
            (v) => Container(
              width: 50,
              padding: const EdgeInsets.all(12),
              alignment: Alignment.center,
              child: Text(v),
            ),
          ),
        ],
      ),
    );
  }

  Widget _poinRowSingle(String kategori, String value) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(kategori),
            ),
          ),
          Container(
            width: 200,
            padding: const EdgeInsets.all(12),
            alignment: Alignment.center,
            child: Text(value),
          ),
        ],
      ),
    );
  }
}