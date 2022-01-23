import 'package:expendituretracker/styles/app_colors.dart';
import 'package:expendituretracker/styles/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataEntryFields extends StatelessWidget {
  const DataEntryFields({Key? key, required this.hintText, required this.func})
      : super(key: key);

  final String hintText;
  final func;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: TextField(
        style: const TextStyle(
          fontFamily: AppFonts.gelasio,
          fontWeight: AppFontWeight.light1,
        ),
        textAlign: TextAlign.center,
        onChanged: func,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.black, width: 1.5),
            borderRadius: BorderRadius.zero,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.black, width: 1.5),
            borderRadius: BorderRadius.zero,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: AppFonts.kalam,
            fontWeight: AppFontWeight.light,
          ),
        ),
      ),
    );
  }
}
