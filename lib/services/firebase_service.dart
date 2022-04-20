import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:press_it/models/group.dart';
import 'package:press_it/services/utils.dart';

class FirebaseService {
  static Stream<Group> getWinnerGroup() {
    String gameId = 'lHWo73hrptfkvqiDtX71';
    return FirebaseFirestore.instance
        .collection('dynamic-press-it')
        .doc(gameId)
        .snapshots()
        .map((event) {
      return Group.fromJson(event.data()!);
    });
  }

  static Future<void> addGroupToRank(String name, int timestamp) async {
    String gameId = 'lHWo73hrptfkvqiDtX71';
    String groupId = Utils.getRandomString(10);
    final rank = await FirebaseFirestore.instance
        .collection('dynamic-press-it')
        .doc(gameId)
        .collection('rank')
        .get();
    List<Rank> groups = [];
    for (var doc in rank.docs) {
      groups.add(Rank.fromJson(doc.data()));
    }
    groups.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    final exists = groups.where((e) => e.groupName == name);
    if (exists.isEmpty) {
      FirebaseFirestore.instance
          .collection('dynamic-press-it')
          .doc(gameId)
          .collection('rank')
          .add({
        "groupId": groupId,
        "groupName": name,
        "timestamp": timestamp,
      });
    }
    if (groups.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('dynamic-press-it')
          .doc(gameId)
          .set({
        "groupWinner": groups.first.groupName,
      });
    }
  }

  static Future<void> resetAllDocuments() async {
    String gameId = 'lHWo73hrptfkvqiDtX71';
    await FirebaseFirestore.instance
        .collection('dynamic-press-it')
        .doc(gameId)
        .set({
      'groupWinner': '',
    });
    await FirebaseFirestore.instance
        .collection('dynamic-press-it')
        .doc(gameId)
        .collection('rank')
        .get()
        .then((value) {
      for (var doc in value.docs) {
        doc.reference.delete();
      }
    });
  }
}
