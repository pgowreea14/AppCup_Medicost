import 'package:flutter/material.dart';
import 'package:medicalapp/model/contrastMode.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: FontStyleOption.values.map((option) {
          return ListTile(
            title: Text(option.toString().split('.').last),
            onTap: () {
              Provider.of<FontStyleProvider>(context, listen: false)
                  .setFontStyle(option);
            },
          );
        }).toList(),
      ),
    );
  }
}
