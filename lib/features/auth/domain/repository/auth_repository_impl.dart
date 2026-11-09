import 'package:donut_app/features/auth/data/repository/auth_repository.dart';
import 'package:donut_app/features/onboarding/domain/entities/user.dart';

class AuthRepositoryImpl implements AuthRepository {


  @override
  Future<User> createUserAndLogin(User user) {
    // TODO: implement createUserAndLogin
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<User> loginWithOTP(String phoneNumber) {
    // TODO: implement loginWithOTP
    throw UnimplementedError();
  }
 }