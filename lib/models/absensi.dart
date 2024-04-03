import 'dart:convert';

import 'package:attendance/models/lokasi.dart';

class Absensi {
  static const tableName = "absensi";

  int? id;
  String? coordinate;
  String? date;
  String? lokasi;
  String? type;
  int? lokasiId;
  Lokasi? lokasiModel;

  Absensi(
      {this.id,
      this.coordinate,
      this.date,
      this.lokasiId,
      this.lokasi,
      this.type,
      this.lokasiModel});

  Absensi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    coordinate = json['coordinate'];
    date = json['date'];
    lokasi = json['lokasi'];
    type = json['type'];
    lokasiId = json['lokasi_id'];
    if (json['lokasiModel'] != null)
      lokasiModel = Lokasi.fromJson(json['lokasiModel']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['coordinate'] = this.coordinate;
    data['date'] = this.date;
    data['lokasi'] = this.lokasi;
    data['lokasi_id'] = this.lokasiId;
    data['type'] = this.type;
    if (this.lokasiModel != null)
      data['lokasiModel'] = this.lokasiModel?.toJson();

    return data;
  }
}
