import 'package:flutter/material.dart';
import 'package:uas_mobile/ui/entryForm.dart';
import 'package:uas_mobile/models/anggota.dart';
import 'package:uas_mobile/helpers/hdatabases.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Note extends StatefulWidget {
  @override
  NoteState createState() => NoteState();
}

class NoteState extends State<Note> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Anggota> anggotaList;

  @override
  Widget build(BuildContext context) {
    if (anggotaList == null) {
      anggotaList = List<Anggota>();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Anggota'),
        centerTitle: true,
        bottom: PreferredSize(
          child: Container(
            color:Colors.purple[500],
            height: 4.0,
          ),
          preferredSize: null
        ),
      ),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Tambah Data',
        onPressed: () async {
          var anggota = await navigateToEntryForm(context, null);
          if (anggota != null) addAnggota(anggota);
        },
      ),
    );
  }

  Future<Anggota> navigateToEntryForm(BuildContext context, Anggota anggota) async {
    var result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) {
              return EntryForm(anggota);
            }
        )
    );
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.blue[200],
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.note, color: Colors.green[800]),
            ),
            title: Text(' '+this.anggotaList[index].nama, style: textStyle,),
            subtitle: Text(' '+this.anggotaList[index].alamat + ' |  ' + this.anggotaList[index].nomor),
            trailing: GestureDetector(
              child: Icon(Icons.delete, color: Colors.red,),
              onTap: () {
                deleteAnggota(anggotaList[index]);
              },
            ),
            onTap: () async {
              var anggota = await navigateToEntryForm(context, this.anggotaList[index]);
              if (anggota != null) editAnggota(anggota);
            },
          ),
        );
      },
    );
  }
  
  void addAnggota(Anggota object) async {
    int result = await dbHelper.insert(object);
    if (result > 0) {
      updateListView();
    }
  }
  
  void editAnggota(Anggota object) async {
    int result = await dbHelper.update(object);
    if (result > 0) {
      updateListView();
    }
  }
  
  void deleteAnggota(Anggota object) async {
    int result = await dbHelper.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  }
  
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Anggota>> anggotaListFuture = dbHelper.getAnggotaList();
      anggotaListFuture.then((anggotaList) {
        setState(() {
          this.anggotaList = anggotaList;
          this.count = anggotaList.length;
        });
      });
    });
  }
}