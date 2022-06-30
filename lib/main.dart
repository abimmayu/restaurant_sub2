import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles_app.dart';
import 'package:restaurant_app/data/api/api.dart';
import 'package:restaurant_app/data/model/restaurant_list_response.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/provider/restaurant_search_provider.dart';
import 'package:restaurant_app/ui/presentation/first_screen.dart';
import 'package:restaurant_app/ui/presentation/search_screen.dart';
import 'package:restaurant_app/ui/presentation/second_screen.dart';

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
    var routeName = SecondScreen.routeName;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RestaurantListProvider>(
          create: (_) => RestaurantListProvider(api: _api),
        ),
        ChangeNotifierProvider<SearchRestaurantProvider>(
          create: (_) => SearchRestaurantProvider(api: _api),
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
        home: const FirstScreen(),
        // initialRoute: SplashScreen.routeName,
        routes: {
          FirstScreen.routeName: (context) => const FirstScreen(),
          routeName: (context) => SecondScreen(
                restaurant:
                    ModalRoute.of(context)?.settings.arguments as Restaurant,
              ),
          SearchScreen.routeName: (context) => const SearchScreen(),
        },
      ),
    );
  }
}
