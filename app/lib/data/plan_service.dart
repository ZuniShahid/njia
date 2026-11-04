// Server-side plan recompute (Cloud Function `computePlan`), used after profile facts change.
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';

abstract class PlanService {
  /// Asks the server to recompute users/{uid}/plans/{goalId}. Failures are logged, not thrown:
  /// the client keeps its local preview until the next sync.
  Future<void> recompute(String goalId);
}

class FirebasePlanService implements PlanService {
  FirebasePlanService(this._functions);
  final FirebaseFunctions _functions;

  @override
  Future<void> recompute(String goalId) async {
    try {
      await _functions.httpsCallable('computePlan').call<dynamic>({'goalId': goalId});
    } catch (e) {
      debugPrint('computePlan failed: $e');
    }
  }
}
