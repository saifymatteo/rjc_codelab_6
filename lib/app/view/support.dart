import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rjc_codelab_6/app/widgets/app_bar.dart';
import 'package:rjc_codelab_6/app/widgets/button.dart';
import 'package:rjc_codelab_6/app/widgets/goal.dart';
import 'package:rjc_codelab_6/app/widgets/support_meter.dart';
import 'package:rjc_codelab_6/constants/constants.dart';

class GDGCommunitySupport extends StatelessWidget {
  const GDGCommunitySupport({super.key});

  static const int _messageGoal = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Community Meter',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColor.mainColor, fontSize: 30),
            ),
            const Text(
              'Goal: $_messageGoal Messages',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColor.mainColor, fontSize: 15),
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('community_support_meter')
                    .snapshots(),
                builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    final messages = snapshot.data!.docs;

                    if (messages.length >= _messageGoal) {
                      return const GDGCommunityGoal();
                    }

                    return Column(
                      children: [
                        Expanded(
                          child:
                              GDGCommunitySupportMeter(count: messages.length),
                        ),
                        const SizedBox(height: 40),
                        GDGCommunityButton(
                          label: 'Send Message',
                          icon: Icons.send_rounded,
                          onTap: () {
                            FirebaseFirestore.instance
                                .collection('community_support_meter')
                                .add(
                              <String, String>{'message': 'I love Flutter!'},
                            );
                            debugPrint('Firebase run');
                          },
                        )
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
