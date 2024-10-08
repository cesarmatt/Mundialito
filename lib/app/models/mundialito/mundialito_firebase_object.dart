import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mundialito/app/utils/date_time_utils.dart';

class MundialitoFirebaseObject {
  MundialitoFirebaseObject({
    required this.name,
    required this.startDate,
    required this.contenders,
    required this.owner,
    required this.matches,
    required this.isCompleted,
    required this.joinCode,
    required this.joinedUsers,
    this.endDate,
    this.uid,
  });

  String? uid;
  String name;
  Timestamp startDate;
  Timestamp? endDate;
  List<dynamic> contenders;
  String owner;
  List<dynamic> matches;
  bool isCompleted;
  String joinCode;
  List<dynamic> joinedUsers;

  static String getFormattedDate(Timestamp? timestamp) {
    var timestampAsDate = timestamp?.toDate() ?? DateTime.now();
    return DateTimeUtils.formatDDmmYY(timestampAsDate);
  }

  MundialitoFirebaseObject.fromJson(Map<String, Object?> json)
      : this(
            name: json['name']! as String,
            startDate: json['startDate']! as Timestamp,
            endDate: json['endDate'] as Timestamp?,
            contenders: json['contenders']! as List<dynamic>,
            owner: json['owner']! as String,
            matches: json['matches']! as List<dynamic>,
            isCompleted: json['isCompleted']! as bool,
            joinCode: json['joinCode']! as String,
            joinedUsers: json['joinedUsers']! as List<dynamic>);

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'startDate': startDate,
      'endDate': endDate,
      'contenders': contenders,
      'owner': owner,
      'matches': matches,
      'isCompleted': isCompleted,
      'joinCode': joinCode,
      'joinedUsers': joinedUsers,
    };
  }
}
