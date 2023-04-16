import 'package:flutter/material.dart';
import 'package:recruitment_division_automation/components/admin_home_page_drawer.dart';
import 'package:recruitment_division_automation/components/circle_chart.dart';
import 'package:recruitment_division_automation/components/column_chart.dart';
import '../components/admin_page_card.dart';
import '../components/custom_app_bar.dart';
import '../utils/config.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      drawer: const AdminHomePageDrawer(),
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: ListView(children: [
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              const AdminPageCard(
                num: '95,5741',
                title: 'Visitors Online',
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                color: Colors.green,
              ),
              Config.spaceMeduim,
              const AdminPageCard(
                num: '45,6334',
                title: 'Weekly Orders',
                icon: Icon(
                  Icons.diamond,
                  color: Colors.white,
                ),
                color: Colors.blue,
              ),
              Config.spaceMeduim,
              const AdminPageCard(
                num: '15,0000\$',
                title: 'Weekly Sales',
                icon: Icon(
                  Icons.sell_rounded,
                  color: Colors.white,
                ),
                color: Colors.orange,
              ),
              Config.spaceMeduim,
              const AdminPageCard(
                num: '325235325',
                title: 'Visitors online',
                icon: Icon(
                  Icons.person_outline_outlined,
                  color: Colors.white,
                ),
                color: Colors.green,
              ),
              Config.spaceMeduim,
              ColumnChart(),
              Config.spaceMeduim,
              CircleChart()
            ],
          ),
        ]),
      ),
    );
  }
}
