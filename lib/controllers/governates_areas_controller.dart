import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/dialog.dart';
import '../models/provinces_model.dart';

class GovernatesAreasController extends GetxController {
  SharedPreferences? prefs;
  String token = '';
  Provinces provinces = Provinces();
  Map<String, List> areas = {};
  String selectedGovernorate = '';
  String selectedArea = '';
  List governorates = [];
  List<dynamic> Apigovernorates = [];
  Map<String, dynamic> goveroratesInfo = {};
  @override
  void onInit() async {
    areas = {
      'الحسكة': ['الحسكة', 'راس العين', 'القامشلي', 'المالكية'],
      'الرقة': ['تل ابيض', 'الثورة', 'الرقة'],
      'دير الزور': ['البوكمال', 'الميادين', 'دير الزور'],
      'ريف دمشق': [
        'دوما',
        'يبرود',
        'النبك',
        'التل',
        'القطيفة',
        'الزبداني',
        'ريف دمشق',
        'قطنة',
        'داريا'
      ],
      'القنيطرة': ['فيق', 'القنيطرة'],
      'السويداء': ['السويداء', 'شهبا', 'صلخد'],
      'درعا': ['الصنمين', 'ازرع', 'درعا'],
      'دمشق': [
        'ساروجة',
        'القنوات',
        'جوبر',
        'الميدان',
        'الشاغور',
        'القدم',
        'كفرسوسة',
        'المزة',
        'دمر',
        'برزة',
        'القابون',
        'ركن الدين',
        'الصالحبة',
        'المهاجرين',
        'اليرموك'
      ],
      'ادلب': ['اريحا', 'معرة النعمان', 'ادلب', 'جسر الشغور', 'حارم'],
      'حلب': [
        'حلب',
        'اعزاز',
        'عفرين',
        'الباب',
        'السفيرة',
        'منبج',
        'جرابلس',
        'عين العرب'
      ],
      'اللاذقية': ['جبلة', 'الحفة', 'القرداحة', 'اللاذقية'],
      'طرطوس': ['بانياس', 'الدريكيش', 'الشيخ بدر', 'صافيتا', 'طرطوس'],
      'حمص': ['تلكلخ', 'حمص', 'القصير', 'المخرم', 'الرستن', 'تدمر'],
      'حماه': ['السلمية', 'السقيلبية', 'محردة', 'مصياف', 'حماه']
    };
    goveroratesInfo.addAll({
      'حماه': [5, 1],
      'حمص': [2, 3],
      'طرطوس': [6, 3],
      'اللاذقية': [4, 6],
      'حلب': [4, 1],
      'ادلب': [8, 2],
      'دمشق': [7, 2],
      'درعا': [3, 5],
      'السويداء': [3, 2],
      'القنيطرة': [3, 3],
      'ريف دمشق': [2, 2],
      'دير الزور': [5, 2],
      'الرقة': [4, 4],
      'الحسكة': [2, 2]
    });
    governorates.addAll([
      'حماه',
      'حمص',
      'طرطوس',
      'اللاذقية',
      'حلب',
      'ادلب',
      'دمشق',
      'درعا',
      'السويداء',
      'القنيطرة',
      'ريف دمشق',
      'دير الزور',
      'الرقة',
      'الحسكة'
    ]);
    prefs = await SharedPreferences.getInstance();
    token = prefs!.getString('token') ?? '';
    getAllProvinces(token);
    super.onInit();
  }

  Future<dynamic> getAllProvinces(String token) async {
    try {
      final response = await Dio().get('http://127.0.0.1:8000/api/provinces',
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          }),
          data: {'token': token});
      if (response.statusCode == 200 && response.data != '') {
        provinces = Provinces.fromJson(response.data);
        Apigovernorates.addAll(provinces.data!);
        print(Apigovernorates[1].name);
        update();
      }
    } catch (error) {
      error.printError();
      dialog('خطأ بالاتصال بالشبكة');
    }
  }
}
