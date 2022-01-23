import 'package:expendituretracker/components/text_fields.dart';
import 'package:expendituretracker/resources/input_data.dart';
import 'package:expendituretracker/resources/strings/app_strings.dart';
import 'package:expendituretracker/routes/routes.dart';
import 'package:expendituretracker/styles/app_colors.dart';
import 'package:expendituretracker/styles/app_fonts.dart';
import 'package:expendituretracker/styles/spacing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputData extends StatefulWidget {
  const InputData({Key? key}) : super(key: key);

  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  String? _decoratorAmount = '0';
  String? _photographerAmount = '0';
  String? _catererAmount = '0';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Data(),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppStrings.title,
                    style: TextStyle(
                      fontFamily: AppFonts.philosopher,
                      fontSize: FontSize.large40,
                      fontWeight: AppFontWeight.semiBold1,
                    ),
                  ),
                  Spacing.sizeBoxHt8,
                  DataEntryFields(
                      hintText: AppStrings.hintText1,
                      func: (data) {
                        setState(() {
                          _decoratorAmount = data;
                        });
                      }),
                  Spacing.sizeBoxHt8,
                  DataEntryFields(
                      hintText: AppStrings.hintText2,
                      func: (data) {
                        setState(() {
                          _photographerAmount = data;
                        });
                      }),
                  Spacing.sizeBoxHt8,
                  DataEntryFields(
                      hintText: AppStrings.hintText3,
                      func: (data) {
                        setState(() {
                          _catererAmount = data;
                        });
                      }),
                  Spacing.sizeBoxHt20,
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          // Data().insertData(
                          //     one: double.parse(_decoratorAmount!),
                          //     two: double.parse(_catererAmount!),
                          //     three: double.parse(_photographerAmount!));
                          Provider.of<Data>(context, listen: false).insertData(
                              one: double.parse(_decoratorAmount!),
                              two: double.parse(_catererAmount!),
                              three: double.parse(_photographerAmount!));
                          Navigator.pushNamed(context, Routes.homeScreen);
                        },
                        child: const Text(
                          AppStrings.buttonText,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.black,
                          textStyle: const TextStyle(
                              fontSize: FontSize.large20,
                              fontFamily: AppFonts.philosopher,
                              fontWeight: AppFontWeight.normal),
                        ),
                      ),
                      decoration: const BoxDecoration(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
