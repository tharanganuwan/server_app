import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:server_app/components/custom_form.dart';
import 'package:server_app/model/server_model.dart';
import 'package:server_app/providers/server_provider.dart';
import 'package:server_app/screens/home_screen.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    Key? key,
    required this.model,
    required this.onTap,
  }) : super(key: key);
  final ServerModel model;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Consumer<ServerProvider>(
        builder: (context, value, child) => Card(
          color: Colors.blueAccent[200],
          child: ListTile(
            title: Text(model.name.toString()),
            subtitle: Text(model.port.toString()),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      ShowForm.showForm(context, model);
                    },
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      value.deleteRoom(context, model.id!, model.name!);
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
