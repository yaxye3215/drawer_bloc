part of 'drawer_bloc.dart';

@immutable
sealed class DrawerEvent {}

class DrawerOpen extends DrawerEvent {
  final NavItem destination;

  DrawerOpen(this.destination);
}
