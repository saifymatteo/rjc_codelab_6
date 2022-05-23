class TeamMember {
  TeamMember({this.fullName, this.photoUrl, this.title});

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
      fullName: json['fullName'].toString(),
      photoUrl: json['photoUrl'].toString(),
      title: json['title'].toString(),
    );
  }

  String? fullName;
  String? photoUrl;
  String? title;
}
