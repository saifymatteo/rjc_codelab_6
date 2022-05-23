// ignore_for_file: prefer_int_literals

import 'package:flutter/material.dart';
import 'package:rjc_codelab_6/constants/constants.dart';

class GDGCommunityGoal extends StatefulWidget {
  const GDGCommunityGoal({super.key});

  @override
  State<GDGCommunityGoal> createState() => _GDGCommunityGoalState();
}

class _GDGCommunityGoalState extends State<GDGCommunityGoal>
    with TickerProviderStateMixin {
  AnimationController? controller;
  AnimationController? textController;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();

    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    textController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeTransition(
          opacity: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: textController!, curve: Curves.easeInOut),
          ),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 0.25),
              end: const Offset(0.0, -0.25),
            ).animate(
              CurvedAnimation(parent: textController!, curve: Curves.easeInOut),
            ),
            child: Column(
              children: const [
                Text(
                  'Congrats!',
                  style: TextStyle(color: AppColor.mainColor, fontSize: 30),
                ),
                SizedBox(height: 5),
                Text(
                  'We did it!',
                  style: TextStyle(color: AppColor.mainColor, fontSize: 50),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        ScaleTransition(
          scale: Tween<double>(begin: 1.0, end: 1.25).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut),
          ),
          child: RotationTransition(
            turns: Tween<double>(begin: -0.05, end: 0.05).animate(
              CurvedAnimation(parent: controller!, curve: Curves.easeInOut),
            ),
            child: const Icon(
              Icons.thumb_up_rounded,
              size: 100,
              color: AppColor.mainColor,
            ),
          ),
        ),
      ],
    );
  }
}
