import '../models/user_model.dart';

class AuthController {
  final User validUser = User(username: 'pengguna', password: 'masuk');

  // Fungsi untuk validasi login
  bool validateLogin(String username, String password) {
    return username == validUser.username && password == validUser.password;
  }
}
