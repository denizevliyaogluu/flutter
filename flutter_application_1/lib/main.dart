import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainlayout.dart';
import 'package:flutter_application_1/screens/auth_page.dart';
import 'package:flutter_application_1/screens/booking_page.dart';
import 'package:flutter_application_1/screens/success_booked.dart';
import 'package:flutter_application_1/utils/config.dart';
import 'package:flutter_application_1/models/auth_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //this is for push navigator
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    //define ThemeData here
    return ChangeNotifierProvider<AuthModel>(
      create: (context) => AuthModel(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Flutter Beauty Center App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //pre-define input decoration
          inputDecorationTheme: const InputDecorationTheme(
            focusColor: Color.fromARGB(255, 217, 205, 220),
            border: Config.outlinedBorder,
            focusedBorder: Config.focusBorder,
            errorBorder: Config.errorBorder,
            enabledBorder: Config.outlinedBorder,
            floatingLabelStyle:
                TextStyle(color: Color.fromARGB(255, 217, 205, 220)),
            prefixIconColor: Colors.black38,
          ),
          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color.fromARGB(255, 217, 205, 220),
            selectedItemColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey.shade700,
            elevation: 10,
            type: BottomNavigationBarType.fixed,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const AuthPage(),
          'main': (context) => const MainLayout(),
          'booking_page': (context) => const BookingPage(),
          'success_booking': (context) => const AppointmentBooked(),
        },
      ),
    );
  }
}
