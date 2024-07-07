import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'drawer_event.dart';
part 'drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc() : super(DrawerInitial(NavItem.homeView)) {
    on<DrawerOpen>((event, emit) {
      emit(DrawerInitial(event.destination));
      print(event.destination);
      // if (event.destination != state.selectedItem) {
      // }
    });
  }
}
