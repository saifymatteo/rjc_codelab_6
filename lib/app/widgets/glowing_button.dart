// ignore_for_file: prefer_int_literals

import 'package:flutter/material.dart';
import 'package:rjc_codelab_6/constants/constants.dart';

class GlowingButton extends StatefulWidget {
  const GlowingButton({super.key, this.onTap});

  final void Function()? onTap;

  @override
  State<GlowingButton> createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Stack(
          children: [
            ScaleTransition(
              scale: Tween<double>(begin: 1.0, end: 1.5).animate(
                CurvedAnimation(parent: controller!, curve: Curves.easeInOut),
              ),
              child: FadeTransition(
                opacity: Tween(begin: 1.0, end: 0.0).animate(
                  CurvedAnimation(parent: controller!, curve: Curves.easeInOut),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppColor.secondaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    color: AppColor.secondaryColor.withOpacity(0.8),
                  ),
                ],
              ),
              child: const Icon(
                Icons.textsms_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
