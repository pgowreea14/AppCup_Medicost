import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF40534C);
const kPrimaryLightColor = Color(0xFFD6BD98);

const double defaultPadding = 16.0;

const kBottomNavigationBarItemSize = 24.0;
const kCategoryCardImageSize = 120.0;

const map = 'assets/images/google-maps.png';
const pill = 'assets/images/pill.png';
const settings = 'assets/images/settings.png';

class Category {
  String thumbnail;
  String name;
  int index;

  Category({required this.name, required this.thumbnail, required this.index});
}

List<Category> categoryList = [
  Category(
      name: 'PRESCRITION', thumbnail: 'assets/images/addbills.png', index: 0),
  Category(
      name: 'MED ALERT', thumbnail: 'assets/images/viewbills.png', index: 1),
  Category(
      name: 'MEDICAL STORE',
      thumbnail: 'assets/images/medicalstore.png',
      index: 2),
  Category(
      name: 'CONSULTATION',
      thumbnail: 'assets/images/assistance.png',
      index: 3),
];
