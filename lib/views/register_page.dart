import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruitment_division_automation/components/dialog.dart';
import 'package:recruitment_division_automation/controllers/register_controller.dart';
import 'package:recruitment_division_automation/views/admin_home_page.dart';

import '../utils/config.dart';
import '../utils/themes.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final controller = Get.put(RegisterController());

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
                        'اسم المستخدم',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                      TextFormField(
                        textDirection: TextDirection.rtl,
                        decoration: const InputDecoration(
                          hintText: 'ادخل اسم المستخدم الخاص بك',
                          hintTextDirection: TextDirection.rtl,
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        controller: controller.nameController,
                      ),
                      Config.spaceSmall,
                      const Text(
                        'البريد الالكتروني',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                      Config.spaceSmall,
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
                      Config.spaceSmall,
                      GetBuilder(
                          init: RegisterController(),
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
                        init: RegisterController(),
                        builder: (controller) {
                        return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade800),
                            onPressed: () async{
                              await controller.registeration(
                                  controller.nameController.text,
                                  controller.passwordController.text,
                                  controller.emailController.text);
                              if (controller.isRegistered) {
                                Get.offAll(() => const AdminHomePage());
                              } else {
                                dialog(controller.message);
                              }
                            },
                            child: const Text('انشاء حساب'));
                      })
                    ],
                  )),
              Config.spaceMeduim,
              InkWell(
                onTap: () {
                  Get.toNamed('/loginpage');
                },
                child: const Text.rich(
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  TextSpan(text: ' لديك حساب؟', children: [
                    TextSpan(
                        text: 'سجل الآن',
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
