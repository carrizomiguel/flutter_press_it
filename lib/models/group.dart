class Group {
  Group({
    required this.groupWinner,
    required this.position,
  });

  String groupWinner;
  int position;

  Group.fromJson(Map<String, Object?> json)
      : this(
          groupWinner: json['group-winner']! as String,
          position: json['position']! as int,
        );
}
