import 'package:bloc_network_exemple/cubit/user_state.dart';
import 'package:bloc_network_exemple/models/user.dart';
import 'package:bloc_network_exemple/services/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository usersRepository;

  UserCubit(this.usersRepository) : super(UserEmptyState());

  Future<void> fetchUsers() async {
    try {
      emit(UserLoadingState());
      final List<User> _loadedUserList = await usersRepository.getAllUsers();
      emit(UserLoadedState(loadedUser: _loadedUserList));
    } catch (_) {
      emit(UserErrorState());
    }
  }

  Future<void> clearEsers() async {
    emit(UserEmptyState());
  }
}