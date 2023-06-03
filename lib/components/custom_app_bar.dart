import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(55);
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return AppBar(
      title: GestureDetector(
        onTap: () {
          if (Get.currentRoute != '/maketransaction') {
            Get.toNamed('/maketransaction');
          }
        },
        child: Row(
          children: const [
            Text(
              'إنشاء معاملة  ',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            Icon(Icons.add_circle_outline)
          ],
        ),
      ),
      actions: [
        PopupMenuButton(
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
              size: 30,
            ),
            itemBuilder: (context) => const [
                  PopupMenuItem(child: Text('تسجيل الخروج')),
                  PopupMenuItem(child: Text('حسابي')),
                ]),
        const SizedBox(
            width: 35,
            height: 35,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/qq.jpg'),
              radius: 50,
            )),
        SizedBox(
          width: Config.screenWidth! * 0.04,
        ),
        SizedBox(width: 45, height: 45, child: Image.asset('assets/logo.png')),
        const SizedBox(
          width: 7,
        ),
      ],
    );
  }
}
