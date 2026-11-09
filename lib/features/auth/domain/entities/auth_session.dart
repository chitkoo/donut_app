import '../../../onboarding/domain/entities/user.dart';

class AuthSession {
  const AuthSession({
    required this.userId,
    required this.user,
  });

  final int userId;
  final User user;
}