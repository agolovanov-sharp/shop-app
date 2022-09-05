import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/providers/cart.dart';
import 'package:shop_app/models/providers/products_provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/product_details_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme =
        ThemeData(primarySwatch: Colors.pink, fontFamily: 'Lato');

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider(create: (ctx) => Cart())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme.copyWith(
            textTheme: ThemeData.light().textTheme.copyWith(
                // bodySmall: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                // bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                // titleSmall: const TextStyle(
                //     fontFamily: 'RobotoCondensed',
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //     color: Color.fromRGBO(20, 51, 51, 1))
                ),
            colorScheme: theme.colorScheme.copyWith(
              primary: Colors.purple,
              secondary: Colors.deepOrange,
            )),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (_) => CartScreen()
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Text(
                'Lets build shop!')) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
