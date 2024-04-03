class Absensi {
  static const tableName = "absensi";

  int? id;
  String? coordinate;
  String? date;
  String? lokasi;
  int? lokasiId;

  Absensi({this.id, this.coordinate, this.date, this.lokasiId, this.lokasi});

  Absensi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    coordinate = json['coordinate'];
    date = json['date'];
    lokasi = json['lokasi'];
    lokasiId = json['lokasi_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['coordinate'] = this.coordinate;
    data['date'] = this.date;
    data['lokasi'] = this.lokasi;
    data['lokasi_id'] = this.lokasiId;
    return data;
  }
}
