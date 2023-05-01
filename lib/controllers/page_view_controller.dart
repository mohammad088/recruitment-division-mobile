import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PageviewController extends GetxController {
  var selectedGovernorates = '';
  final List governorates = [
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
  ];
  final Map<String, List> areas = {
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
  var selectedArea = '';
  String selectedStatus = '';
  String selectedTransactionType = '';

  bool firstNameerror = true;
  bool lastNameerror = true;
  bool fatherNameerror = true;
  bool motherNameerror = true;
  bool numberLengthError = true;
  bool nationalNumberError = true;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController governorateNameController = TextEditingController();
  TextEditingController areaNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nationalNumberController = TextEditingController();
  TextEditingController restrictionNumberController = TextEditingController();
  int currentPage = 0;
  List<String> enlistmentStatus = ['حالة1', 'حالة2', 'حالة3'];
  List<String> transactionType = ['نوع1', 'نوع2', 'نوع3'];
  final PageController controller = PageController();
  void onChange(value) {
    currentPage = value;
    update();
  }

  File specialImage = File('');
  File frontIdImage = File('');
  File backIdImage = File('');
  File anotherImage = File('');
  final pickedFile = ImagePicker();

  Future<File> uploadImage(File image) async {
    final pickedImage = await pickedFile.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      update();
      return image;
    } else {
      update();
      image = File('');
      return image;
    }
  }
}
