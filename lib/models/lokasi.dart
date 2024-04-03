class Lokasi {
  static const String tableName = "lokasi";

  int? id;
  String? namaLokasi;
  String? alamat;
  String? coordinate;
  double? distance;

  Lokasi(
      {this.id, this.namaLokasi, this.alamat, this.coordinate, this.distance});

  Lokasi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaLokasi = json['nama_lokasi'];
    alamat = json['alamat'];
    coordinate = json['coordinate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_lokasi'] = this.namaLokasi;
    data['alamat'] = this.alamat;
    data['coordinate'] = this.coordinate;
    return data;
  }
}
