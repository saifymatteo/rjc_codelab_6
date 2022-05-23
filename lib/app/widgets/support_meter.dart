import 'package:flutter/material.dart';
import 'package:rjc_codelab_6/constants/constants.dart';

class GDGCommunitySupportMeter extends StatelessWidget {
  const GDGCommunitySupportMeter({super.key, this.count});

  final int? count;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 150,
          height: 150,
          child: Stack(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: const Icon(
                    Icons.chat_bubble_rounded,
                    color: AppColor.mainColor,
                    size: 150,
                  ),
                ),
              ),
              Center(
                child: Text(
                  count!.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: const Text(
            'Messages\nIn Firebase',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColor.mainColor),
          ),
        ),
        Container(
          width: 200,
          height: count!.toDouble(),
          decoration: const BoxDecoration(
            color: AppColor.mainColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
        ),
        Container(
          height: 10,
          color: AppColor.mainColor,
        )
      ],
    );
  }
}
