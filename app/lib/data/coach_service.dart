// Coach chat: always answered server-side (Cloud Function `coach`, handover task 7), never by a
// model call from the client. Until the function exists the UI shows an honest "not connected" reply.
import 'package:cloud_functions/cloud_functions.dart';

class CoachMessage {
  const CoachMessage({required this.fromCoach, required this.text});
  final bool fromCoach;
  final String text;
}

abstract class CoachService {
  /// [context] names the plan part (whole plan / phase / step / pool) or the study mode.
  Future<String> ask({required String goalId, required Map<String, Object?> context, required List<CoachMessage> history, required String question});
}

class CoachNotConnected implements Exception {
  const CoachNotConnected();
  @override
  String toString() => 'The coach is not connected yet.';
}

class FirebaseCoachService implements CoachService {
  FirebaseCoachService(this._functions);
  final FirebaseFunctions _functions;

  @override
  Future<String> ask({required String goalId, required Map<String, Object?> context, required List<CoachMessage> history, required String question}) async {
    try {
      final res = await _functions.httpsCallable('coach').call<dynamic>({
        'goalId': goalId,
        'context': context,
        'history': [for (final m in history) {'role': m.fromCoach ? 'assistant' : 'user', 'text': m.text}],
        'question': question,
      });
      final data = res.data;
      final text = data is Map ? data['text'] : null;
      if (text is! String || text.isEmpty) throw const CoachNotConnected();
      return text;
    } on FirebaseFunctionsException catch (e) {
      if (e.code == 'not-found' || e.code == 'unimplemented' || e.code == 'unavailable' || e.code == 'internal') throw const CoachNotConnected();
      rethrow;
    }
  }
}
