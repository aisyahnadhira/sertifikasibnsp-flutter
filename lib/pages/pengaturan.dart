import 'package:flutter/material.dart';

class Pengaturan extends StatefulWidget {
  const Pengaturan({super.key});

  @override
  State<Pengaturan> createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text("Pengaturan",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20)),
                ),
                Text(
                  "Ganti Password",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 8),
                Text("Password Saat Ini",
                    style: TextStyle(fontWeight: FontWeight.w900)),
                TextField(),
                SizedBox(height: 20),
                Text("Password Baru",
                    style: TextStyle(fontWeight: FontWeight.w900)),
                TextField(),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 175, 253, 215),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Colors.black, width: 1)),
                      child: Text(
                        'Simpan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Text(
                      '<< Kembali',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 185.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Colors.black, width: 3)),
                      child: Icon(Icons.person, size: 100),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About this App..",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          ),
                          Text("Aplikasi ini dibuat oleh:",
                              style: TextStyle(fontWeight: FontWeight.w700)),
                          Text("Nama: Aisyah Nadhira Salma M",
                              style: TextStyle(fontWeight: FontWeight.w700)),
                          Text("NIM: 2141764010",
                              style: TextStyle(fontWeight: FontWeight.w700)),
                          Text("Tanggal: 21 Oktober 2021",
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
