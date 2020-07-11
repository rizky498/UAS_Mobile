class Anggota {
  int _id;
  String _nama;
  String _alamat;
  String _nomor;
  
  Anggota(this._nama, this._alamat, this._nomor);

  Anggota.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nama = map['nama'];
    this._alamat = map['alamat'];
    this._nomor = map['nomor'];
  }

  // getter
  int get id => _id;
  String get nama => _nama;
  String get alamat => _alamat;
  String get nomor => _nomor;

  // setter
  set nama(String value) {
    _nama = value;
  }

  set alamat(String value) {
    _alamat = value;
  }

  set nomor(String value) {
    _nomor = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nama'] = nama;
    map['alamat'] = alamat;
    map['nomor'] = nomor;
    return map;
  }
}