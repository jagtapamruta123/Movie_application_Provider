import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app_assignment/application/app_router.dart';
import 'package:movie_app_assignment/common/resources/app_colors.dart';
import 'package:movie_app_assignment/common/resources/app_strings.dart';
import 'package:movie_app_assignment/data/hive_local_db/hive_config.dart';
import 'package:movie_app_assignment/presentation/provider.dart';
import 'package:provider/provider.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await HiveConfigurations.init(); //Hive box creation and opening box to store data
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MovieProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, //Orientation will be portrait
    ]);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      locale: const Locale('en', 'US'),

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        appBarTheme: const AppBarTheme(),
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: AppStrings().app_title,
      //callback to generate named routes
      onGenerateRoute: (settings) => AppRouter().router(settings),
    );
  }
}
