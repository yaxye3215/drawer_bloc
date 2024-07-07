part of 'drawer_bloc.dart';

enum NavItem {
  homeView,
  profileView,
  orderView,
  cartView,
}

@immutable
sealed class DrawerState {}

class DrawerInitial extends DrawerState {
  final NavItem selectedItem;
  DrawerInitial(this.selectedItem);
}
