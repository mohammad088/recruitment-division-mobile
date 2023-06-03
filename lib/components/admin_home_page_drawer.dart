import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/config.dart';

class AdminHomePageDrawer extends StatelessWidget {
  const AdminHomePageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Drawer(
      child: ListView(
        children: [
          GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Config.spaceMeduim,
                const SizedBox(
                  width: 90,
                  height: 90,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/qq.jpg'),
                    radius: 50,
                  ),
                ),
                Config.spaceSmall,
                const Text(
                  'MyName',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
          Config.spaceMeduim,
          ListTile(
            onTap: () => Get.toNamed('/adminhomepage'),
            leading: const Icon(
              Icons.home,
              size: 30,
              color: Colors.grey,
            ),
            title: const Text('الرئيسية',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal)),
          ),
          Divider(
            color: Colors.grey.shade800,
          ),
          ListTile(
            leading: const Icon(
              Icons.folder_open_sharp,
              size: 30,
              color: Colors.grey,
            ),
            onTap: () => Get.toNamed('/TransactionsPage'),
            title: const Text('معاملاتي',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal)),
          ),
          Divider(
            color: Colors.grey.shade800,
          ),
          Accordion(
              paddingListBottom: 10,
              contentBorderColor: Colors.white,
              contentBackgroundColor: Colors.white,
              headerPadding: const EdgeInsets.only(left: 10),
              rightIcon: const Icon(
                Icons.arrow_downward_rounded,
                color: Colors.grey,
                size: 30,
              ),
              headerBackgroundColor: Colors.white,
              leftIcon: const Icon(
                Icons.business_center_rounded,
                color: Colors.grey,
                size: 30,
              ),
              children: [
                AccordionSection(
                    header: const Text('مراكزنا',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.normal)),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListTile(
                          onTap: () => Get.toNamed('/governoratespage'),
                          leading: const Icon(Icons.forward),
                          title: const Text('المحافظات',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal)),
                        ),
                        ListTile(
                          onTap: () {
                            Get.toNamed('/allareas');
                          },
                          leading: const Icon(Icons.forward),
                          title: const Text('المناطق',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal)),
                        ),
                      ],
                    ))
              ]),
          Divider(
            color: Colors.grey.shade800,
          ),
          ListTile(
            leading: const Icon(
              Icons.business_center,
              size: 30,
              color: Colors.grey,
            ),
            onTap: () {
              Get.toNamed('/commonquestions');
            },
            title: const Text('أسئلةواستفسارات',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal)),
          ),
          Divider(
            color: Colors.grey.shade800,
          ),
          ListTile(
            onTap: () => Get.toNamed('/userinfo'),
            leading: const Icon(
              Icons.business_center,
              size: 30,
              color: Colors.grey,
            ),
            title: const Text('تواصل معنا',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal)),
          ),
        ],
      ),
    );
  }
}
