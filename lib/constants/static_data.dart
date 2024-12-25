import 'package:flutter/material.dart';
import 'package:vaccination/constants/images.dart';

import 'colors.dart';

List<Map<String, dynamic>> notifications = [
  {
    "id": 3,
    "name":
        "Your Nzuri wallet has been credited \nwith shs 40,000 payable before\n4th July 2024",
    "color": greenBG,
  },
  {
    "id": 3,
    "name":
        "Your Nzuri wallet has been credited\nwith shs 40,000 payable before\n5th July 2024",
    "color": blackBG,
  },
];
List<Map<String, dynamic>> tabsList = [
  {
    "id": 1,
    "name": "Add Vaccine",
    "iconData": Icons.add,
    "color": blueBG,
  },
  {
    "id": 2,
    "name": "Account",
    "iconData": Icons.person,
    "color": blueBG,
  },
  {
    "id": 3,
    "name": "Find",
    "iconData": Icons.location_city,
    "color": blueBG,
  },
  {
    "id": 4,
    "name": "FAQS",
    "color": blueBG,
    "iconData": Icons.question_answer,
  },
  {
    "id": 5,
    "name": "Contact Us",
    "color": blueBG,
    "iconData": Icons.contact_emergency,
  },
];

List<Map<String, dynamic>> adsList = [
  {
    "id": 1,
    "image": ad1,
  },
  {
    "id": 2,
    "image": ad2,
  },
  {
    "id": 3,
    "image": ad3,
  },
];
