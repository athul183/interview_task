import 'package:flutter/material.dart';

class ReturnOrderScreen extends StatelessWidget {
  const ReturnOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
        Padding(
          padding: EdgeInsets.only(left: 170),
          child: Icon(Icons.add_chart_sharp,size: 40,),
        )
      ],),
    );
  }
}