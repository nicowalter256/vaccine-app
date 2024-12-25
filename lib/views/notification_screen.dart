import 'package:flutter/material.dart';
import 'package:vaccination/widgets/single_notification.dart';

import '../../widgets/bottom_navigation.dart';
import '../../widgets/custom_app_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavigationWidget(),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 30),
            CustomAppBarWidget(
                //title: 'Notifications',
                ),
            SizedBox(height: 20),
            SingleNotification(),
          ],
        ),
      )),
    );
  }
}
