import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assignment4/presentation/bloc/documentBloc.dart';
import 'package:assignment4/presentation/pages/layoutHome.dart';

//acessing state of navigator
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => DocumentBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'My Documents',
      debugShowCheckedModeBanner: false,//banner removal
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          primary: Color.fromARGB(255, 97, 192, 194),
        ),
      ),
      home: const LayoutHome(),
    );
  }
}
