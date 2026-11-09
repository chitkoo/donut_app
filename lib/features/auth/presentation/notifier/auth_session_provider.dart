import 'package:donut_app/features/auth/domain/entities/auth_session.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/storage/secure_storage_provider.dart';
import '../../../onboarding/data/repository/user_repository.dart';
import '../../../onboarding/domain/repository/user_repository_impl.dart';

final authSessionProvider =
    AsyncNotifierProvider<AuthSessionNotifier, AuthSession?>(
      AuthSessionNotifier.new,
    );

class AuthSessionNotifier extends AsyncNotifier<AuthSession?> {
  static const _userIdKey = 'current_user_id';

  late FlutterSecureStorage _storage;
  late UserRepository _userRepository;

  @override
  Future<AuthSession?> build() async {
    _storage = ref.read(secureStorageProvider);
    _userRepository = ref.read(userRepositoryProvider);

    return _restoreSession();
  }

  Future<AuthSession?> _restoreSession() async {
    final storedUserId = await _storage.read(key: _userIdKey);

    if (storedUserId == null) return null;

    final userId = int.tryParse(storedUserId);

    if (userId == null) {
      await _storage.delete(key: _userIdKey);
      return null;
    }

    final user = await _userRepository.getUserById(userId);

    if (user == null) {
      await _storage.delete(key: _userIdKey);
      return null;
    }

    return AuthSession(userId: user.id ?? 0);
  }

  Future<void> login(int userId) async {
    final user = await _userRepository.getUserById(userId);

    if (user == null) {
      throw Exception('User does not exist');
    }

    await _storage.write(key: _userIdKey, value: user.id.toString());

    state = AsyncData(AuthSession(userId: user.id ?? 0));
  }

  Future<void> logout() async {
    await _storage.delete(key: _userIdKey);

    state = const AsyncData(null);
  }
}
