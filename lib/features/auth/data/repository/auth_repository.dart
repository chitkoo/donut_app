import '../../../onboarding/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<User> createUserAndLogin(User user);

  Future<User> loginWithOTP(String phoneNumber);

  Future<void> logOut();
}
