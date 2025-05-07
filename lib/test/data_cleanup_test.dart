import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../lib/services/data_cleanup_service.dart';

class MockFirestore extends Mock implements FirebaseFirestore {}

void main() {
  group('Data Cleanup Service', () {
    late MockFirestore mockFirestore;
    late DataCleanupService dataCleanupService;

    setUp(() {
      mockFirestore = MockFirestore();
      dataCleanupService = DataCleanupService();
    });

    test('Removes old data correctly', () async {
      final mockCollection = MockCollectionReference();
      final mockQuerySnapshot = MockQuerySnapshot();

      when(mockFirestore.collection('visitors')).thenReturn(mockCollection);
      when(mockCollection.where(any, isLessThan: any))
          .thenReturn(mockCollection);
      when(mockCollection.get()).thenAnswer((_) async => mockQuerySnapshot);
      when(mockQuerySnapshot.docs).thenReturn([]);

      await dataCleanupService.cleanOldData('visitors', 30);

      verify(mockCollection.where('timestamp', isLessThan: any)).called(1);
      verify(mockCollection.get()).called(1);
    });
  });
}