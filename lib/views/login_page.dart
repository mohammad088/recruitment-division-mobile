import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruitment_division_automation/components/dialog.dart';
import 'package:recruitment_division_automation/controllers/login_controller.dart';
import 'package:recruitment_division_automation/views/admin_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/config.dart';
import '../utils/themes.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: Config.blockSizeVertical! * 4,
              bottom: 10,
              left: 15,
              right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Themes.themeData.scaffoldBackgroundColor,
                  radius: Config.blockSizeHorizontal! * 15,
                  child: Image.asset('assets/logo.png'),
                ),
              ),
              Config.spaceSmall,
              const Text(
                'أهلا بكم في موقعنا الالكتروني',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
              ),
              Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'البريد الالكتروني',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                      TextFormField(
                        textDirection: TextDirection.rtl,
                        decoration: const InputDecoration(
                          hintText: 'ادخل بريدك الالكتروني',
                          hintTextDirection: TextDirection.rtl,
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        controller: controller.emailController,
                      ),
                      Config.spaceSmall,
                      const Text(
                        'كلمة المرور',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                      GetBuilder(
                          init: LoginController(),
                          builder: (cont) {
                            return TextFormField(
                              obscureText: controller.obscureText,
                              textDirection: TextDirection.rtl,
                              decoration: InputDecoration(
                                prefixIcon: IconButton(
                                    onPressed: () {
                                      cont.changeVisibility();
                                    },
                                    icon: controller.obscureText
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility)),
                                hintText: 'ادخل كلمة المرور',
                                hintTextDirection: TextDirection.rtl,
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              controller: controller.passwordController,
                            );
                          }),
                      Config.spaceMeduim,
                      GetBuilder(
                          init: LoginController(),
                          builder: (controller) {
                            return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green.shade800),
                                onPressed: () async {
                                  if (await controller.getUserInfo(
                                      controller.passwordController.text,
                                      controller.emailController.text)) {
                                    Get.off(() => const AdminHomePage());
                                  } else {
                                    dialog('الحساب غير الموجود');
                                  }
                                },
                                child: const Text('تسجيل الدخول'));
                          })
                    ],
                  )),
              Config.spaceBig,
              InkWell(
                onTap: () => Get.toNamed('/registerpage'),
                child: const Text.rich(
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  TextSpan(text: ' ليس لديك حساب؟', children: [
                    TextSpan(
                        text: 'انشئ الآن',
                        style: TextStyle(color: Colors.blueAccent))
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
