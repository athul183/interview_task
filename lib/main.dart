import 'package:flutter/material.dart';
import 'package:interview_task/providers/customers_provider.dart';
import 'package:interview_task/providers/products_provider.dart';
import 'package:interview_task/screens/home_screen.dart';
import 'package:interview_task/screens/main_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductsProvider()),
        ChangeNotifierProvider(create: (context) => CustomersProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true
        ),
        home: const BottomNavBar(),
      ),
    );
  }
}
