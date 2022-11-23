import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project/app/freezed/user_data2.dart';
import 'package:project/app/pcategories/bloc/profileb_bloc.dart';
import 'package:project/data/model/project/project_categories_response.dart';
import 'package:project/screen/login/auth/constants/constants.dart' as constants;

class ProjectcPage extends StatefulWidget {
  @override
  State<ProjectcPage> createState() => _ProjectcPageState();
}

class _ProjectcPageState extends State<ProjectcPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfilebBloc()..add(ProfilebEvent.getAllUserData()),
      child: BlocConsumer<ProfilebBloc, ProfilebState>(
        listener: (context, state) {
          state.maybeMap(
              orElse: () {},
              isLoading: (e) => HomeLoadingPage(),
              isSuccess: (value) => print(
                    value.projectResponse.toJson(),
                  ));
        },
        builder: (context, state) {
          return state.maybeMap(
              orElse: () => HomeLoadingPage(),
              isLoading: (e) => HomeLoadingPage(),
              isError: (value) => HomePageError(context),
              isSuccess: (value) =>
                  HomePageScaffold(context, value.projectResponse.data));
        },
      ),
    );
  }

  Scaffold HomePageError(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Erros Mising Name",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {
                BlocProvider.of<ProfilebBloc>(context)
                    .add(ProfilebEvent.getAllUserData());
              },
              icon: Icon(Icons.replay),
            )
          ],
        ),
      ),
    );
  }

  Scaffold HomeLoadingPage() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Scaffold HomePageScaffold(BuildContext context,  List<Data2>? _data) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("Data"),

        // title: Text(widget.loginResponse.token!),
      ),
      body: Container(
          child: ListView.builder(
              itemCount: _data!.length,
              itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      // backgroundImage: NetworkImage("${_data[index].id}"),
                    ),
                    // subtitle: Text("Alamat email :${_data[index].email}"),

                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ID :${_data[index].id}"),
                        Text("Nama :${_data[index].name}"),
                        Text("Last Name :${_data[index].description}"),
                        Text("Alamat email :${_data[index].createdAt}"),
                        Divider(
                          height: 3,
                        )
                      ],
                    ),
                  ))),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project/app/controller/controller_project_categories.dart';

// class ProjectPage extends StatelessWidget {
//   ProjectPage({Key? key}) : super(key: key);
//   final _pController = Get.find<ProjectCategoriesController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Center(
//         child: 
//             ListView.builder(
//               itemBuilder: ((context, index) => 
//               Text(
//                   '${_pController.projectcategoriess[index].data}')),
                  
//             )
//           // Text(
//           //           '${_pController.projectcategoriess[]}')
//         ),
//       ),
//     );
//   }
// }
