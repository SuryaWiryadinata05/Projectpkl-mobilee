import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project/screen/login/auth/constants/constants.dart' as constants;
import 'package:project/screen/login/auth/models/login_response.dart';
import '../../../data/event/bloc/user_bloc_bloc.dart';

class SidebarPage extends StatefulWidget {
  const SidebarPage({Key? key}) : super(key: key);

  @override
  State<SidebarPage> createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  @override
  late LoginResponse _loginResponse;

  @override
  void initstate() {
    // final _loginResponse = GetStorage().read(constants.USER_LOCAL_KEY);
    final _data = GetStorage().read(constants.USER_LOCAL_KEY);
    _loginResponse = LoginResponse.fromJson(jsonDecode(_data));

    super.initState();
  }

  Widget build(
    BuildContext context,
  ) {
    return BlocProvider(
      create: (context) =>
          UserBlocBloc()..add(const UserBlocEvent.getAllUserData()),
      child: BlocConsumer<UserBlocBloc, UserBlocState>(
        listener: (context, state) {
          state.maybeMap(
              orElse: () {},
              isLoading: (e) => UserLoadingPage(),
              isSuccess: ((value) => value.loginResponse.toJson()));
        },
        builder: (context, state) {
          return state.maybeMap(
            orElse: () => UserLoadingPage(),
            isLoading: (e) => UserLoadingPage(),
            isSuccess: (value) => UserPage(context, value.loginResponse.dataa),
          );
        },
      ),
    );
  }

  // ignore: avoid_types_as_parameter_names
  Drawer UserPage(BuildContext context, List<User>? _data) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 218, 218, 221),
      child: ListView(
        padding: EdgeInsets.zero,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          UserAccountsDrawerHeader(
            accountName: ListView.builder(
              itemCount: _data!.length,
              itemBuilder: (context, index) => Text(
                "${_data[index].name}",
                style: TextStyle(
                  fontFamily: 'RobotoMono',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            accountEmail: Text(
              "suryawiryadinata@gmail.com",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'RobotoLight',
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(),
            ),
            decoration: BoxDecoration(),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Testing'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.manage_accounts),
            title: Text('example'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.gamepad_outlined),
            title: Text('Management'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.umbrella),
            title: Text('project'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('User Management'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }

  Scaffold UserLoadingPage() {
    return Scaffold(
      body: Center(
        child: Container(),
      ),
    );
  }
}
