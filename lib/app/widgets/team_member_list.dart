import 'package:flutter/material.dart';
import 'package:rjc_codelab_6/constants/constants.dart';
import 'package:rjc_codelab_6/data/models/team_member_model.dart';

class TeamMemberList extends StatelessWidget {
  const TeamMemberList({super.key, this.members});

  final List<TeamMember>? members;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: members?.length,
      itemBuilder: (_, index) {
        final member = members![index];

        return TeamMemberCard(
          member: member,
        );
      },
    );
  }
}

class TeamMemberCard extends StatelessWidget {
  const TeamMemberCard({super.key, this.member});

  final TeamMember? member;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              member!.photoUrl!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                member!.fullName!,
                style: const TextStyle(color: AppColor.mainColor, fontSize: 25),
              ),
              Text(
                member!.title!,
                style: const TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
