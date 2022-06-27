import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/cubit/states.dart';
import 'package:news/network/cache_helper.dart';
import 'package:news/network/dio_helper.dart';
import 'package:news/screens/main_screen.dart';

import 'cubit/cubit.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark=CacheHelper.getData(key: 'isDark');
  runApp( MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp({Key? key, this.isDark}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>NewsCubit()..getBusinessNews()..changeAppMode(fromShared: isDark),
        child:BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.deepOrange[600],
    unselectedItemColor: Colors.grey[700],
    elevation: 10.0,
    showUnselectedLabels: true,
    ),

    textTheme: const TextTheme(
    bodyText1: TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: 18.0
    ),
    ),
    ),
    darkTheme: ThemeData(
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: HexColor('333739'),
    appBarTheme: AppBarTheme(
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: HexColor('333739'),
    statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: const TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.deepOrange[600],
    unselectedItemColor: Colors.grey[700],
    backgroundColor: HexColor('333739'),
    elevation: 10.0,
    showUnselectedLabels: true,
    ),

    textTheme: const TextTheme(
    bodyText1: TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontSize: 18.0
    )
    ),
    ),
    themeMode: NewsCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
    home: MainScreen(),
    );
    },
    )
    );
  }
}

