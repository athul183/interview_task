// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:interview_task/providers/customers_provider.dart';
import 'package:interview_task/providers/products_provider.dart';
import 'package:interview_task/screens/customer_screen.dart';
import 'package:interview_task/screens/product_screen.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // list of items
  List<Widget> griditems = [
    GridItem(iconData: Icons.groups_rounded, text: "Customers"),
    GridItem(iconData: Icons.production_quantity_limits, text: "Products"),
    GridItem(iconData: Icons.add_chart_sharp, text: "New Order"),
    GridItem(iconData: Icons.keyboard_return_outlined, text: "Return Order"),
    GridItem(iconData: Icons.payment, text: "Add Payment"),
    GridItem(iconData: Icons.playlist_add_check_rounded, text: "Today's Order"),
    GridItem(iconData: Icons.description, text: "Today's Summery"),
    GridItem(iconData: Icons.route_rounded, text: "Route"),
  ];

  void onTapped(BuildContext context, int index) {
    if (index == 0) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CustomerScreen(),
        ),
      );
    } else if (index == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ProductScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);
    productsProvider.getProductFromAPI();
    CustomersProvider customersProvider =
        Provider.of<CustomersProvider>(context, listen: false);
    customersProvider.getCustomersFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
          ),
        ),
        actions: const [
          Image(
            image: AssetImage("assets/icons/menu-bar.png"),
            height: 35,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 5,
          mainAxisExtent: MediaQuery.of(context).size.height * 0.16,
        ),
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        itemCount: griditems.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              onTapped(context, index);
            },
            borderRadius: BorderRadius.circular(20),
            splashColor: Colors.indigo[800],
            child: griditems[index],
          );
        },
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  GridItem({super.key, required this.iconData, required this.text});
  IconData iconData;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 1,
            color: Colors.grey.shade300,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 40,
            color: Colors.indigo[600],
          ),
          const SizedBox(height: 10,),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
