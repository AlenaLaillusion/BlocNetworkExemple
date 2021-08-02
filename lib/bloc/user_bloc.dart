import 'package:bloc_network_exemple/bloc/user_event.dart';
import 'package:bloc_network_exemple/bloc/user_state.dart';
import 'package:bloc_network_exemple/models/user.dart';
import 'package:bloc_network_exemple/services/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
 final UserRepository usersRepository;

 UserBloc({this.usersRepository}) : assert(usersRepository != null);

@override
UserState get initialState =>  UserEmptyState();

@override
  Stream<UserState> mapEventToState(UserEvent event) async* {

  if(event is UserLoadEvent) {
    yield UserLoadingState();
    try {
      final List<User> _loadedUserList = await usersRepository.getAllUsers();
      yield UserLoadedState(loadedUser: _loadedUserList);
 } catch (_) {
 yield UserErrorState();
 }
 } else if(event is UserCleanEvent) {
 yield UserEmptyState();
 }
 }
}
