
import 'package:bloc_network_exemple/models/user.dart';
import 'package:bloc_network_exemple/services/user_api_provider.dart';

class UserRepository {
  UserProvider _usersProvider = UserProvider();
  Future<List<User>> getAllUsers() => _usersProvider.getUser();
}