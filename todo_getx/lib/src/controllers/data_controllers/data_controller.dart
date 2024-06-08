import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DataController extends GetxController {
  bool _isInit = false;
  final Rx<PackageInfo?> packageInfo = Rxn();
}
