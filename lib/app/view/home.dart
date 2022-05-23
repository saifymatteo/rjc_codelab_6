import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rjc_codelab_6/app/view/support.dart';
import 'package:rjc_codelab_6/app/widgets/app_bar.dart';
import 'package:rjc_codelab_6/app/widgets/glowing_button.dart';
import 'package:rjc_codelab_6/app/widgets/team_member_list.dart';
import 'package:rjc_codelab_6/constants/constants.dart';
import 'package:rjc_codelab_6/data/models/team_member_model.dart';

class GDGCommunityHome extends StatelessWidget {
  const GDGCommunityHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      floatingActionButton: GlowingButton(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<Widget>(
              builder: (_) => const GDGCommunitySupport(),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Image.network(
                AppImage.gdgCommunityLogoBlue,
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              color: AppColor.lightMainColor,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: const [
                  Icon(
                    Icons.people_rounded,
                    size: 30,
                    color: AppColor.mainColor,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Meet the Team',
                    style: TextStyle(
                      color: AppColor.mainColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: FirebaseFirestore.instance.collection('team').get(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    final memberDocs = (snapshot.data! as QuerySnapshot).docs;
                    final members = memberDocs
                        .map(
                          (doc) => TeamMember.fromJson(
                            doc.data()! as Map<String, dynamic>,
                          ),
                        )
                        .toList();

                    return TeamMemberList(members: members);
                  }

                  return const Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        valueColor: AlwaysStoppedAnimation(AppColor.mainColor),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
