import 'package:flutter/material.dart';
import 'package:rjc_codelab_6/app/view/home.dart';
import 'package:rjc_codelab_6/constants/constants.dart';

class GDGCommunitySplash extends StatefulWidget {
  const GDGCommunitySplash({super.key});

  @override
  State<GDGCommunitySplash> createState() => _GDGCommunitySplashState();
}

class _GDGCommunitySplashState extends State<GDGCommunitySplash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<Widget>(
          builder: (_) => const GDGCommunityHome(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              AppImage.gdgCommunityLogoWhite,
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                strokeWidth: 5,
                valueColor: AlwaysStoppedAnimation(
                  Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
