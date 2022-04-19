import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:press_it/models/group.dart';

class FirebaseService {
  static Future<void> pressGroupName(String name) async {
    String groupId = 'lHWo73hrptfkvqiDtX71';
    final doc = await FirebaseFirestore.instance
        .collection('dynamic-press-it')
        .doc(groupId)
        .get();
    final position = doc.get('position');
    if (position == 0) {
      FirebaseFirestore.instance
          .collection('dynamic-press-it')
          .doc(groupId)
          .set({
        'group-winner': name,
        'position': 1,
      });
    }
  }

  static Stream<Group> getWinnerGroup() {
    return FirebaseFirestore.instance
        .collection('dynamic-press-it')
        .snapshots()
        .map((snapshot) {
      final doc = snapshot.docs.first;
      return Group.fromJson(doc.data());
    });
  }
}
