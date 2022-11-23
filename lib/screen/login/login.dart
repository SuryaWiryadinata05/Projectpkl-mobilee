import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:project/app/core/data/models/task.dart';
import 'package:project/app/core/data/providers/task/provider.dart';
import 'package:project/app/core/data/services/storage/repository.dart';
import 'package:project/app/core/utils/extension.dart';
import 'package:project/app/controller/controller.dart';
import 'package:project/screen/login/auth/cubit/auth_cubit.dart';
import 'package:project/screen/login/auth/models/login_request.dart';
import 'package:project/screen/login/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../app/modules/home/view.dart';

class LoginOnePage extends StatefulWidget {
  LoginOnePage({Key? key}) : super(key: key);
  final homeCtrl = Get.find<HomeController>();

  @override
  State<LoginOnePage> createState() => _LoginOnePageState();
}

// final emailController = TextEditingController();
// final passwordController = TextEditingController();

class _LoginOnePageState extends State<LoginOnePage> {
  bool _isSecurePassword = true;
  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double mwidth = width * 0.50;
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
          if (state is AuthError) {
            // showDialog(
            //   context: context,
            //   builder: (context) => AlertDialog(
            //     title: Text("Error"),
            //     content: Text(state.errormessage),
            //   ),
            // );
            SnackbarError(state, 'Error');
          } else if (state is AuthLoading) {
            print("Loading");
            const Center(
                child: SpinKitSpinningLines(
              color: Colors.white,
              size: 50,
            ));
          } else if (state is AuthLoginSuccess) {
            // Yg Dibawah yg Bukan Versi null safety
            // context.bloc<AuthCubit>().saveUserToLocal(state.dataLogin);
            BlocProvider.of<AuthCubit>(context)
                .saveUserToLocal(state.dataLogin);
          } else if (state is AuthSuccess) {
            SnackbarSuccess('Berhasil');
            Get.to(() => HomePage());
            Get.put(HomeController(
                taskRepository: TaskRepository(taskprovider: TaskProvider())));
          }
        }, builder: (context, state) {
          // return Container(
          //   padding: EdgeInsets.all(20.0),
          //   color: Colorpalette.primaryDarkcolor,
          //   child: ListView(
          //     children: <Widget>[
          //       Column(
          //         children: <Widget>[
          //           Lottie.asset("assets/lotties/logo_login.json",
          //               width: 80.0.wp, fit: BoxFit.cover),

          //           SizedBox(
          //             height: 9.0.wp,
          //           ),
          //           TextFormField(
          //             controller: _emailController,
          //             decoration: const InputDecoration(
          //               border: UnderlineInputBorder(),
          //               enabledBorder: UnderlineInputBorder(
          //                 borderSide: BorderSide(
          //                   color: Colorpalette.underlineTextField,
          //                   width: 1.5,
          //                 ),
          //               ),
          //               focusedBorder: UnderlineInputBorder(
          //                 borderSide:
          //                     BorderSide(color: Colors.white, width: 3.0),
          //               ),
          //               hintText: "Username / Email",
          //               hintStyle: TextStyle(
          //                   color: Colorpalette.hintcolor,
          //                   fontFamily: 'Robotolight'),
          //             ),
          //             validator: ((value) {
          //               if (value == null || value.trim().isEmpty) {
          //                 return 'Mohon Diisi Pengisian Task Kamu';
          //               }
          //               return null;
          //             }),
          //             style: TextStyle(color: Colors.white),
          //             autofocus: false,
          //           ),
          //           SizedBox(
          //             height: 11.0.wp,
          //           ),
          //           TextFormField(
          //             obscureText: _isSecurePassword,
          //             controller: _passwordController,
          //             decoration: InputDecoration(
          //                 border: UnderlineInputBorder(),
          //                 enabledBorder: UnderlineInputBorder(
          //                   borderSide: BorderSide(
          //                     color: Colorpalette.underlineTextField,
          //                     width: 1.5,
          //                   ),
          //                 ),
          //                 focusedBorder: UnderlineInputBorder(
          //                   borderSide:
          //                       BorderSide(color: Colors.white, width: 3.0),
          //                 ),
          //                 hintText: 'Password',
          //                 hintStyle: TextStyle(
          //                     color: Colorpalette.hintcolor,
          //                     fontFamily: 'Robotolight'),
          //                 suffixIcon: togglePassword()),
          //             validator: ((value) {
          //               if (value == null || value.trim().isEmpty) {
          //                 return 'Mohon Diisi Pengisian Task Kamu';
          //               }
          //               return null;
          //             }),
          //             style: TextStyle(color: Colors.white),
          //             autofocus: false,
          //           ),
          //           SizedBox(
          //             height: 13.0.wp,
          //           ),
          //           Row(
          //             children: <Widget>[
          //               Expanded(
          //                   child: (state is AuthLoading)
          //                       ? _loadingButton()
          //                       : _loginButton(context)),
          //             ],
          //           ),
          //           SizedBox(
          //             height: 40,
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // );
          return ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: WaveClipper2(),
                    child: Container(
                      child: Column(),
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color.fromARGB(31, 36, 36, 36),
                        Color.fromARGB(31, 4, 33, 85)
                      ])),
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipper3(),
                    child: Container(
                      child: Column(),
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color.fromARGB(68, 9, 9, 9),
                        Color.fromARGB(68, 1, 12, 95)
                      ])),
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipper1(),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 40,
                          ),
                          Image.asset(
                            'assets/images/logo.png',
                            width: 33.0.wp,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Base App",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 30),
                          ),
                        ],
                      ),
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 124, 173, 246),
                        Color.fromARGB(255, 111, 183, 234)
                      ])),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: TextField(
                    controller: homeCtrl.emailController,
                    onChanged: (String value) {},
                    cursorColor: Color.fromARGB(255, 73, 62, 58),
                    decoration: const InputDecoration(
                        hintText: "Username / Email",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Icon(
                            Icons.person_outline_sharp,
                            color: Colors.blue,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Material(
                  elevation: 2.0,
                  shadowColor: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: TextField(
                    obscureText: _isSecurePassword,
                    controller: homeCtrl.passwordController,
                    onChanged: (String value) {},
                    cursorColor: Colors.deepOrange,
                    decoration: InputDecoration(
                        hintText: "Password",
                        suffixIcon: togglePassword(),
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Icon(
                            Icons.lock,
                            color: Colors.blue,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: (state is AuthLoading)
                          ? _loadingButton()
                          : _loginButton(context)),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[],
              )
            ],
          );
        }),
      ),
    );
  }

  void SnackbarError(AuthError state, String msg) {
    Get.snackbar(state.errormessage, msg,
        duration: const Duration(
          seconds: 1,
        ),
        icon: const Icon(
          Icons.error,
          color: Color.fromARGB(255, 230, 80, 70),
          size: 30,
        ),
        boxShadows: const [
          BoxShadow(
            blurStyle: BlurStyle.inner,
            color: Colors.white54,
            blurRadius: 5,
          ),
        ]);
  }

  void SnackbarSuccess(String msg) {
    Get.snackbar('Authentikasi Berhasil', msg,
        duration: const Duration(
          seconds: 1,
        ),
        icon: const Icon(
          Icons.check_box,
          color: Color.fromARGB(255, 60, 243, 51),
          size: 30,
        ),
        boxShadows: const [
          BoxShadow(
            blurStyle: BlurStyle.inner,
            color: Colors.white54,
            blurRadius: 5,
          ),
        ]);
  }

  Center _loadingButton() {
    return Center(
      child: GestureDetector(
        onTap: null,
        child: const SpinKitSpinningLines(
          color: Colors.black,
          size: 50.0,
        ),
      ),
    );
  }

  Container _loginButton(BuildContext context) {
    final homeCtrl = Get.find<HomeController>();
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: RaisedButton(
        padding: const EdgeInsets.all(16.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.blue[200],
        textColor: Colors.white,
        onPressed: () {
          final _requestData = LoginRequest(
              username: homeCtrl.emailController.text,
              password: homeCtrl.passwordController.text);
          // context.bloc<AuthCubit>().signInUser(_requestData);
          BlocProvider.of<AuthCubit>(context).signInUser(_requestData);
          // context.bloc<AuthCubit>().signInUser(_requestData);
        },
        child: const Text(
          'Login',
          style: TextStyle(color: kTextColor, fontSize: 16.0),
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
        onPressed: () {
          setState(() {
            _isSecurePassword = !_isSecurePassword;
          });
        },
        icon: _isSecurePassword
            ? const Icon(Icons.visibility)
            : const Icon(Icons.visibility_off));
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
