import 'package:flutter/material.dart';

class OutputAPK extends StatelessWidget {
  OutputAPK(
    {
      @required this.nama,
      @required this.alamat,
      @required this.pokokpinjaman,
      @required this.bungapinjaman,
      @required this.durasi
    }
  );

  final int pokokpinjaman;
  final int bungapinjaman;
  final int durasi;
  final String nama;
  final String alamat;

  @override
  Widget build(BuildContext context) {
    double jumlahPokok = pokokpinjaman + (pokokpinjaman * bungapinjaman * durasi) / 100;
    double jumlahbunga = (jumlahPokok - pokokpinjaman);
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hasil'),
        bottom: PreferredSize(
            child: Container(
              color: Colors.purple[500],
              height: 4.0,
            ),
            preferredSize: null),
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            
            Container(
              padding: EdgeInsets.all(4),
              color: Colors.black,
            ),

            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
              decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.purple,
                    width: 5,
                  )
                ),

                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Hasil Akumulasi Pinjaman',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600),
                      ),
                      padding: EdgeInsets.only(left: 70, right: 50, top:5, bottom:5 ),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        )
                      ),
                    ),
                    
                    Text(
                      "Nama Peminjam",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    
                    Text(
                      "$nama",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Colors.yellowAccent),
                    ),

                    Text(
                      "Alamat Peminjam",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    Text(
                      "$alamat",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Colors.yellowAccent),
                    ),

                    Text(
                      "Pokok Pinjaman",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    Text(
                      "$pokokpinjaman",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Colors.yellowAccent),
                    ),

                    Text(
                      "Bunga Pinjaman",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w800),
                    ),

                    Text(
                      "$bungapinjaman%",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Colors.yellowAccent),
                    ),

                    Text(
                      "durasi",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w800),
                    ),

                    Text(
                      "$durasi Tahun",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Colors.yellowAccent),
                    ),

                     Text(
                      "Total Bunga ",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w800),
                    ),

                    Text(
                      "$jumlahbunga",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Colors.yellowAccent),
                    ),


                    Text(
                      "Total Pinjaman Beserta Bunga",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w800),
                    ),

                    Text(
                      "$jumlahPokok",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Colors.yellowAccent),
                    )
                  ],
                )
              ),
              
              Container(
              margin: EdgeInsets.only(left: 60, right: 60,top:20, bottom: 20),
              child: RaisedButton(
                 onPressed: () {
                    Navigator.pop(context);
                  },
                padding: EdgeInsets.only(top: 5, bottom: 5),
                color: Colors.purple,
                child: Text(
                  'Kembali',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
