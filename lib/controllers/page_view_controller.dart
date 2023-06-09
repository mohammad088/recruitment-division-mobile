import 'dart:io';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/dialog.dart';
import '../models/areas_model.dart' as area;
import '../models/provinces_model.dart';
import '../models/transastions.dart' as tran;
import '../models/transaction_table.dart' as trant;

class PageviewController extends GetxController {
  String link = 'http://10.0.2.2:8000';
  GlobalKey selectedAreaKey = GlobalKey();
  bool storeAccess = false;
  int role = 1;
  List<area.Data> proAreas = [
    area.Data(id: 0, name: 'اختر منطقتك', provincesId: 15)
  ];
  area.AreasModel areasModel = area.AreasModel();
  late SharedPreferences prefs;
  late String token;
  int selectedGovernorates = 0;
  List<Data> governorates = [];
  Provinces provinces = Provinces();
  int selectedArea = 0;
  String selectedStatus = '';
  String selectedTransactionType = '';
  bool firstNameerror = true;
  bool lastNameerror = true;
  bool fatherNameerror = true;
  bool motherNameerror = true;
  bool numberLengthError = true;
  bool nationalNumberError = true;
  TextEditingController firstNameController =
      TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController governorateNameController = TextEditingController();
  TextEditingController areaNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nationalNumberController = TextEditingController();
  TextEditingController restrictionNumberController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  int currentPage = 0;
  List<tran.Province> enlistmentStatus = [
    tran.Province(id: 1, name: 'معفي'),
    tran.Province(id: 2, name: 'وحيد'),
    tran.Province(id: 3, name: 'وحيد'),
    tran.Province(id: 4, name: 'مؤجل')
  ];
  List<tran.Transactiontype> transactionType = [
    tran.Transactiontype(id: 1, type: 'تأجيل دراسي'),
    tran.Transactiontype(id: 2, type: 'وحيد'),
    tran.Transactiontype(id: 3, type: 'اذن سفر'),
    tran.Transactiontype(id: 4, type: 'بيان وضع'),
  ];
  final PageController controller = PageController();
  File specialImage = File('');
  File frontIdImage = File('');
  File backIdImage = File('');
  File anotherImage = File('');
  final pickedFile = ImagePicker();

  void onChange(value) {
    currentPage = value;
    update();
  }

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

  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';
    await getrole();
    getAllProvinces(token);
    super.onInit();
  }

  Future<dynamic> getAllProvinces(String token) async {
    try {
      final response = await Dio.Dio().get('$link/api/provinces',
          options: Dio.Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          }),
          data: {'token': token});
      if (response.statusCode == 200 && response.data != '') {
        provinces = Provinces.fromJson(response.data);
        governorates.addAll(provinces.data!);
        update();
      }
    } catch (error) {
      error.printError();
      dialog('خطأ بالاتصال بالشبكة');
    }
  }

  Future<dynamic> getAllProvinceRegions(String token, int proId) async {
    try {
      final response = await Dio.Dio().get('$link/api/provinces/$proId',
          options: Dio.Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token'
            },
          ),
          data: {'token': token});
      if (response.statusCode == 200 && response.data != '') {
        areasModel = area.AreasModel.fromJson(response.data);
        proAreas = areasModel.data!;
        update();
      }
    } catch (error) {
      dialog('هنالك خطأ');
    }
  }

  Future<bool> addNewTransaction(trant.Data data, String token) async {
    String attachedImage = data.attachedImage!.path.split('/').last;
    String userImage = data.userImage!.path.split('/').last;
    String frontFaceOfIdentity = data.frontFaceOfIdentity!.path.split('/').last;
    String backFaceOfIdentity = data.backFaceOfIdentity!.path.split('/').last;
    final GetConnect connect = GetConnect(timeout: const Duration(seconds: 10));
    final FormData formData = FormData({
      'front_face_of_identity': MultipartFile(
          File(data.frontFaceOfIdentity!.path),
          filename: frontFaceOfIdentity),
      'back_face_of_identity': MultipartFile(
          File(data.backFaceOfIdentity!.path),
          filename: backFaceOfIdentity),
      'attached_image': MultipartFile(File(data.attachedImage!.path),
          filename: attachedImage),
      'user_image':
          MultipartFile(File(data.userImage!.path), filename: userImage),
      'name': data.name,
      'user_id': data.userId,
      'notes': data.notes,
      'province_id': data.provinceId,
      'region_id': data.regionId,
      'mother_name': data.motherName,
      'father_name': data.fatherName,
      'family_name': data.familyName,
      'phone1': data.phone1,
      'transactiontype_id': data.transactiontypeId,
      'token': token,
      'village_number': int.parse(data.villageNumber!),
      'national_identification_number': data.nationalIdentificationNumber,
      'enlistment_statue_id': data.enlistmentStatueId
    });
    try {
      final Response response = await connect.post(
          '$link/api/transaction/store', formData,
          headers: {'Authorization': 'Bearer $token'});
      print(response.body);
      if (response.statusCode == 200 && response.body != '') {
        print(response.body);
        storeAccess = true;
        update();
        return storeAccess;
      }
      return storeAccess;
    } catch (error) {
      error.printError();
      dialog('هنالك خطأ');
      return storeAccess;
    }
  }

  Future<dynamic> getrole() async {
    role = prefs.getInt('role') ?? 1;
    if (role > 1) {
      update();
    }
  }
}
