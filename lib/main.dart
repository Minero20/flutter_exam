import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import './bloc/cart_bloc.dart';
import './screens/home_screen.dart';
// import 'provider/cart_provider.dart';

void main() {
  runApp(
    // MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (BuildContext context) => CartBloc()),
    //   ],
    //   child: const MyApp(),
    // ),
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'โรงแรมคุณภาพพพดี',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );

    // return ChangeNotifierProvider(
    //   create: (context) => CartProvider(),
    //   child: MaterialApp(
    //     title: 'อาหารสัตว์',
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //       useMaterial3: true,
    //     ),
    //     home: const Home(),
    //   ),
    // );
  }
}
