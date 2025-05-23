import 'package:flutter/material.dart';

class KasFragment extends StatelessWidget {
  final String nama;
  final int absen;
  final int mingguBelumBayar;

  KasFragment({
    required this.nama,
    required this.absen,
    required this.mingguBelumBayar,
  });

  @override
  Widget build(BuildContext context) {
    int totalKasBelumBayar = mingguBelumBayar * 5000;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Card(
          margin: EdgeInsets.all(16),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Nama: $nama', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('Absen: $absen', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text(
                  'Minggu belum bayar: $mingguBelumBayar',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 24),
                if (mingguBelumBayar == 0)
                  Text(
                    'Makasih udah bayar kasnya!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  )
                else
                  Text(
                    'Total kas belum dibayar: Rp$totalKasBelumBayar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
