import 'package:flutter/material.dart';

import '../../bloc/drawer_bloc.dart';
import 'list_pages_widget.dart';

class NavigationItem {
  final NavItem item;
  final String title;
  final IconData icon;

  NavigationItem(this.item, this.title, this.icon);
}

// ignore: must_be_immutable
class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});

  List<NavigationItem> items = [
    NavigationItem(
      NavItem.homeView,
      "Home",
      Icons.home,
    ),
    NavigationItem(
      NavItem.orderView,
      "Oders",
      Icons.category,
    ),
    NavigationItem(
      NavItem.cartView,
      "Cart ",
      Icons.shopping_bag,
    ),
    NavigationItem(
      NavItem.profileView,
      "Profile",
      Icons.person,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Yahye Ataa"),
            accountEmail: Text("yahyeataa@gmail.com"),
            currentAccountPicture: CircleAvatar(
                //backgroundImage: AssetImage("assets/images/yahye.jpg"),
                ),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDsou-9Yj0s2NTQ1pGx4zvMQj12BW1NUvgLA&s'),
              fit: BoxFit.cover,
            )),
          ),
          ListPagesWidget(items: items),
        ],
      ),
    );
  }
}
