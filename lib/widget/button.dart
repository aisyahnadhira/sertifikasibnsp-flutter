import 'package:flutter_application_5/pages/beranda.dart';
import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  const Button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: Colors.black, width: 2)),
            child: Text(
              'Reset',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 175, 253, 215),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: Colors.black, width: 2)),
            child: Text(
              'Simpan',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Beranda()));
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: Colors.black, width: 2)),
            child: Text(
              '<< Kembali',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ],
    );
  }
}
