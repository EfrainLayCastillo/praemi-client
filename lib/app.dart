import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praemiclient/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:praemiclient/screens/VendorOrderScreen/VendorOrderScreen.dart';
import 'repositories/user_repository.dart';
import 'screens/SplashScreen/splash_screen.dart';
import 'screens/LoginScreen/login_screen.dart';
import 'package:praemiclient/screens/PromoScreen/PromoScreen.dart';

class App extends StatelessWidget {
  final UserRepository userRepository;
  const App({
    Key key,
    @required this.userRepository,
  })  : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
      child: AppView(userRepository: userRepository),
    );
  }
}

class AppView extends StatefulWidget {
  UserRepository userRepository;
  AppView({this.userRepository});
  
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Praemi App Client',
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: Color(0xFF033045),
        ),
        navigatorKey: _navigatorKey,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is Unauthenticated) {
              // return LoginPage(
              //   userRepository: widget.userRepository,
              // );
              return VendorOrderScreen();
            }
            if (state is Authenticated) {
              if (state.userModel.roles == "dc_vendor") {
                return VendorOrderScreen();
              }
              return PromoScreen(
                userData: state.userModel,
              );
              // _navigator.pushAndRemoveUntil<void>(
              //   PromoScreen.route(),
              //   (route) => false,
              // );
            }
            return LoadingCircle();
          },
        ),
        onGenerateRoute: (_) => SplashPage.route());
  }
}

class LoadingCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CircularProgressIndicator(),
        alignment: Alignment(0.0, 0.0),
      ),
    );
  }
}
