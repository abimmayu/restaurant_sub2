import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/navigation_app.dart';
import 'package:restaurant_app/common/styles_app.dart';
import 'package:restaurant_app/data/api.dart';
import 'package:restaurant_app/provider/restaurant_detail_provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/ui/detail_screen.dart';
import 'package:restaurant_app/ui/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Api _api = Api();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RestaurantProvider>(
          create: (_) => RestaurantProvider(api: _api),
        ),
        ChangeNotifierProvider<RestaurantDetailProvider>(
          create: (_) => RestaurantDetailProvider(api: _api),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Restaurant App',
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: textTheme,
          appBarTheme: AppBarTheme(titleTextStyle: textTheme.headline6),
        ),
        navigatorKey: navigator,
        home: const HomeScreen(),
        // initialRoute: SplashScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          DetailScreen.routeName: (context) => DetailScreen(
                restaurants:
                    ModalRoute.of(context)?.settings.arguments as String,
              ),
        },
      ),
    );
  }
}
