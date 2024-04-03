import 'package:attendance/controller/absensi_controller.dart';
import 'package:attendance/controller/lokasi_controller.dart';
import 'package:get/instance_manager.dart';

Future<void> init() async {
  //controller
  Get.lazyPut(() => LokasiController(), fenix: true);
  Get.lazyPut(() => AbsensiController(), fenix: true);
}
