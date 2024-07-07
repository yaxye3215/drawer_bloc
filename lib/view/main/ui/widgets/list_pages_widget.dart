
import 'package:drawer_bloc/view/main/bloc/drawer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'drawer_widget.dart';

class ListPagesWidget extends StatelessWidget {
  const ListPagesWidget({
    super.key,
    required this.items,
  });

  final List<NavigationItem> items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return BlocBuilder<DrawerBloc, DrawerState>(
            builder: (context, state) {
              final selectItem = state as DrawerInitial;
              return ListTile(
                leading: Icon(
                  items[index].icon,
                  color: items[index].item == selectItem.selectedItem
                      ? Colors.deepPurple
                      : Colors.black,
                ),
                title: Text(
                  items[index].title,
                  style: TextStyle(
                    color: items[index].item == selectItem.selectedItem
                        ? Colors.deepPurple
                        : Colors.black,
                  ),
                ),
                onTap: () {
                  //  the selected
                  BlocProvider.of<DrawerBloc>(context)
                      .add(DrawerOpen(items[index].item));
                  Navigator.pop(context);
                  //  print(selectItem.selectedItem);
                },
              );
            },
          );
        },
      ),
    );
  }
}
