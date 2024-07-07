import 'package:drawer_bloc/view/main/bloc/drawer_bloc.dart';
import 'package:drawer_bloc/view/main/ui/widgets/drawer_widget.dart';
import 'package:drawer_bloc/view/pages/home_page.dart';
import 'package:drawer_bloc/view/pages/oders_page.dart';
import 'package:drawer_bloc/view/pages/profile_page.dart';
import 'package:drawer_bloc/view/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late DrawerBloc drawerBloc;
  @override
  void initState() {
    drawerBloc = DrawerBloc();
    super.initState();
  }

  Widget? contant;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => drawerBloc,
      child: BlocConsumer<DrawerBloc, DrawerState>(
        listener: (context, state) {
          if (state is DrawerInitial) {
            switch (state.selectedItem) {
              case NavItem.homeView:
                contant = const HomePage();
              case NavItem.profileView:
                contant = const ProfilePage();
              case NavItem.orderView:
                contant = const OdersPage();
              case NavItem.cartView:
                contant = const SettingPage();
              default:
                Container();
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Ataaaaaaaaa'),
            ),
            drawer: DrawerWidget(),
            body: AnimatedSwitcher(
              switchInCurve: Curves.easeInExpo,
              switchOutCurve: Curves.easeOutExpo,
              duration: const Duration(milliseconds: 400),

              /// Each Item Body/Content
              child: contant,
            ),
          );
        },
      ),
    );
  }
}
