import 'package:flutter/material.dart';
import 'package:uas_mobile/models/anggota.dart';

class EntryForm extends StatefulWidget {
  final Anggota anggota;
  EntryForm(this.anggota);
  @override
  EntryFormState createState() => EntryFormState(this.anggota);
}

class EntryFormState extends State<EntryForm> {
  Anggota anggota;
  EntryFormState(this.anggota);
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController nomorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (anggota != null) {
      namaController.text = anggota.nama;
      alamatController.text = anggota.alamat;
      nomorController.text = anggota.nomor;
    }

    return Scaffold(
       backgroundColor: Colors.tealAccent,
        appBar: AppBar(
          title: anggota == null ? Text('Tambah') : Text('Edit'),
          centerTitle: true,
          bottom: PreferredSize(
          child: Container(
            color:Colors.purple[500],
            height: 4.0,
          ),
          preferredSize: null
        ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left:10.0, right:10.0),
          child: ListView(
            children: <Widget> [
              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: namaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'nama',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: alamatController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Alamat',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: nomorController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'No Hp',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:10.0, bottom:10.0),
                child: Row(
                  children: <Widget> [
                    Expanded(
                      child: RaisedButton(
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text(
                          'Simpan',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (anggota == null) {
                            anggota = Anggota(namaController.text, alamatController.text, nomorController.text);
                          } else {
                            anggota.nama = namaController.text;
                            anggota.alamat = alamatController.text;
                            anggota.nomor= nomorController.text;
                          }
                          Navigator.pop(context, anggota);
                        },
                      ),
                    ),
                    Container(width: 5.0,),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.redAccent,
                        textColor: Colors.white,
                        child: Text(
                          'Batal',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}