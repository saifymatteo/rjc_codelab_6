import 'package:flutter/material.dart';
import 'package:rjc_codelab_6/constants/constants.dart';

class GDGCommunityButton extends StatelessWidget {
  const GDGCommunityButton({super.key, this.label, this.onTap, this.icon});

  final String? label;
  final void Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: AppColor.secondaryColor,
      child: InkWell(
        onTap: onTap,
        splashColor: AppColor.lightMainColor,
        highlightColor: AppColor.lightMainColor,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label!,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
