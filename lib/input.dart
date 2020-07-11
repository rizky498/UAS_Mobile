import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:uas_mobile/ui/note.dart';

import 'Output.dart';
import 'about_me.dart.';

class InputData extends StatefulWidget {
  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  TextEditingController nama = TextEditingController();
  TextEditingController alamat = TextEditingController();
  int pokok = 0;
  int bunga = 0;
  int tahun = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.face, color: Colors.white, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyProfil()),
              );
            },
        ),
        title: Text('         SIMULASI KREDIT'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.note_add, color: Colors.white, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Note()),
              );
            },
          ),
        ],
        bottom: PreferredSize(
            child: Container(
              color: Colors.red[500],
              height: 4.0,
            ),
            preferredSize: null),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              color: Colors.pink,
              child: Column(
                children: <Widget>[
                  Text(
                    'APLIKASI ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.0,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Menghitung Bunga Pinjaman',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.0,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                    height: 22,
                  ),
                    TextField(
                      controller: nama,
                      decoration: InputDecoration(
                        hintText: "Masukkan Nama Peminjam",
                        labelText: "Nama Lengkap",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                    height: 22,
                  ),
                    TextField(
                      controller: alamat,
                      decoration: InputDecoration(
                        hintText: "Masukkan Alamat Peminjam",
                        labelText: "Alamat",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                    height: 22,
                  ),
                    TextField(
                      onChanged: (txt) {
                        setState(() {
                          pokok = int.parse(txt);
                        });
                      },
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                          labelText: "Pokok Pinjaman",
                          suffix: Text('Rupiah'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          hintText: 'Jumlah Pinjaman'),
                    ),
                    
                    SizedBox(
                    height: 22,
                  ),
                    TextField(
                      onChanged: (txt) {
                        setState(() {
                          bunga = int.parse(txt);
                        });
                      },
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                          labelText: "Besar Bunga",
                          suffix: Text('%'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          hintText: 'percent'),
                    ),
                    
                    SizedBox(
                    height: 22,
                  ),
                    TextField(
                      onChanged: (txt) {
                        setState(() {
                          tahun = int.parse(txt);
                        });
                      },
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                          labelText: "Durasi Pinjaman",
                          suffix: Text('Tahun'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          hintText: 'Tahun'),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(left: 70, right: 70, bottom: 20),
              child: RaisedButton(
                onPressed: () {
                  _sendDataTobmiResult(context);
                },
                padding: EdgeInsets.only(top: 5, bottom: 5),
                color: Colors.pink,
                child: Text(
                  'Hitung',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
      ),
    );
  }

  void _sendDataTobmiResult(BuildContext context) {
    String textToSend = nama.text;
    String text = alamat.text;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OutputAPK(
                  nama: textToSend,
                  alamat: text,
                  pokokpinjaman: pokok,
                  bungapinjaman: bunga,
                  durasi: tahun,
                )
              )
            );
  }
}
