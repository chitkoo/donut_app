import 'package:donut_app/features/auth/presentation/notifier/auth_session_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';

class RouterRefreshNotifier extends ChangeNotifier {
  RouterRefreshNotifier(Ref ref) {
    ref.listen(authSessionProvider, (previous, next) {
      notifyListeners();
    });
  }
}

final routerRefreshProvider = Provider<RouterRefreshNotifier>((ref) {
  final notifier = RouterRefreshNotifier(ref);

  ref.onDispose(notifier.dispose);

  return notifier;
});