class Group {
  Group({
    required this.groupWinner,
  });

  String groupWinner;

  Group.fromJson(Map<String, Object?> json)
      : this(
          groupWinner: json['groupWinner']! as String,
        );
}

class Rank {
  Rank({
    required this.groupId,
    required this.groupName,
    required this.timestamp,
  });

  String groupId;
  String groupName;
  int timestamp;

  Rank.fromJson(Map<String, Object?> json)
      : this(
          groupId: json['groupId']! as String,
          groupName: json['groupName']! as String,
          timestamp: json['timestamp']! as int,
        );
}
