import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mundialito/app/models/match/match_firebase_object.dart';
import 'package:mundialito/app/models/mundialito/mundialito_firebase_object.dart';

abstract class CreateMundialitoService {
  Future<String> createMundialito(MundialitoFirebaseObject mundialito);
  Future<DocumentReference<MatchFirebaseObject>> saveMatch(MatchFirebaseObject match);
}