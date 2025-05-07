import 'package:cloud_firestore/cloud_firestore.dart';

class LogService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addLog({
    required String description,
    required String userId,
    required String role,
    required String actionType,
    Map<String, dynamic>? additionalData,
  }) async {
    try {
      await _firestore.collection('logs').add({
        'description': description,
        'userId': userId,
        'role': role,
        'actionType': actionType, // Tipo de ação (login, cadastro, etc.)
        'additionalData': additionalData ?? {}, // Dados adicionais
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Erro ao registrar log: $e');
    }
  }

  Stream<QuerySnapshot> getLogs() {
    return _firestore.collection('logs').orderBy('timestamp', descending: true).snapshots();
  }
}