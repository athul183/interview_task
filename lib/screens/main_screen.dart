import 'package:flutter/material.dart';
import 'package:interview_task/screens/cartscreen.dart';
import 'package:interview_task/screens/customer_screen.dart';
import 'package:interview_task/screens/home_screen.dart';
import 'package:interview_task/screens/neworderscreen.dart';
import 'package:interview_task/screens/product_screen.dart';
import 'package:interview_task/screens/returnorderscreen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    //final ThemeData theme = Theme.of(context);
    return Scaffold(
      
      bottomNavigationBar: NavigationBar(
        
        indicatorColor: Colors.transparent,
        
        backgroundColor: Colors.white,
        //elevation: 2,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          
           NavigationDestination(
            
            selectedIcon: Icon(Icons.home,color: Colors.indigo,),
            icon: Icon(Icons.home_outlined,color: Colors.indigo,),
            label: 'Home',
          ),
           NavigationDestination(
            icon:  Icon(Icons.add_chart_sharp,color: Colors.indigo,),
            label: 'New Order',
          ),
          NavigationDestination(
            icon: Badge(
              backgroundColor: Colors.indigo,
              label: Text('2'),
              child: Icon(Icons.production_quantity_limits,color: Colors.indigo,),
            ),
            label: 'Cart',
          ),
           NavigationDestination(
            icon:  Icon(Icons.keyboard_return_outlined,color: Colors.indigo,),
            label: 'Return Order',
          ),
         NavigationDestination(
            icon: Icon(Icons.groups_rounded,color: Colors.indigo,),
            label: 'Customers',
          )
        ],
      ),
      body: <Widget>[

        HomeScreen(),
        NewOrder(),
        CartScreen(),
        ReturnOrderScreen(),
        CustomerScreen()
        
      ][currentPageIndex],
    );
  }
}