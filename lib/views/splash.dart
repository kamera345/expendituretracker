import 'package:expendituretracker/resources/strings/app_strings.dart';
import 'package:expendituretracker/routes/routes.dart';
import 'package:expendituretracker/styles/app_colors.dart';
import 'package:expendituretracker/styles/app_fonts.dart';
import 'package:expendituretracker/styles/spacing.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, Routes.dataInputScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.thickBlue,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextStyle(
              style: const TextStyle(
                color: AppColors.white,
                fontFamily: AppFonts.philosopher,
                fontSize: FontSize.large60,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    AppStrings.title,
                  ),
                ],
                isRepeatingAnimation: false,
              ),
            ),
            Spacing.sizeBoxHt8,
            DefaultTextStyle(
              style: const TextStyle(
                color: AppColors.white,
                fontFamily: AppFonts.gelasio,
                fontSize: FontSize.large15,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(AppStrings.subTitle),
                ],
                isRepeatingAnimation: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
