//import 'package:bloc_network_exemple/bloc/user_bloc.dart';
import 'package:bloc_network_exemple/cubit/user_cubit.dart';
import 'package:bloc_network_exemple/services/user_repository.dart';
import 'package:bloc_network_exemple/widgets/action_buttons.dart';
import 'package:bloc_network_exemple/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final usersRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit> (
      create: (context) => UserCubit(usersRepository),
      child:  Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Users lists'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ActionButtons(),
            Expanded(child: UserList())
          ],
        ),
      ),
    );
  }
}
