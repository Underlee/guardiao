import 'package:cloud_firestore/cloud_firestore.dart';

class DataCleanupService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> cleanOldData(String collectionPath, int daysToKeep) async {
    try {
      final cutoff = DateTime.now().subtract(Duration(days: daysToKeep));
      final query = await _firestore
          .collection(collectionPath)
          .where('timestamp', isLessThan: Timestamp.fromDate(cutoff))
          .get();

      for (var doc in query.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      print('Erro ao limpar dados antigos: $e');
    }
  }
}