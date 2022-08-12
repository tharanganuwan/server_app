import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:server_app/components/custom_form.dart';
import 'package:server_app/components/custom_record_form%20.dart';
import 'package:server_app/model/record_model.dart';
import 'package:server_app/model/server_model.dart';
import 'package:server_app/providers/record_provider.dart';
import 'package:server_app/providers/server_provider.dart';
import 'package:server_app/screens/home_screen.dart';

class ListRecordCard extends StatelessWidget {
  const ListRecordCard({
    Key? key,
    required this.model,
  }) : super(key: key);
  final RecordModel model;

  @override
  Widget build(BuildContext context) {
    return Consumer<RecordProvider>(
      builder: (context, value, child) => Card(
        color: Colors.blueAccent[200],
        child: ListTile(
          title: Text(model.id.toString()),
          subtitle: Text(model.cammand.toString()),
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    ShowRecordForm.showForm(context, model);
                  },
                  icon: Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    value.deleteRoom(context, model.id!, model.description!);
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
