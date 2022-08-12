import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:server_app/components/custome_textfield.dart';
import 'package:server_app/model/server_model.dart';
import 'package:server_app/providers/record_provider.dart';
import 'package:server_app/providers/server_provider.dart';

import '../model/record_model.dart';

class ShowRecordForm {
  static void showForm(BuildContext context, RecordModel? model) {
    if (model != null) {
      Provider.of<RecordProvider>(context, listen: false)
          .setTextControllers(model);
    }
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Consumer<RecordProvider>(
            builder: (context, value, child) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: 'Status',
                      controller: value.statusController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: 'Cammand',
                      controller: value.cammandController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: 'Time Value',
                      controller: value.timeController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: 'Description',
                      controller: value.desController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: 'Cammand Run Time',
                      controller: value.runtimeController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print(model == null);
                        model == null
                            ? value.addNewRecord(context)
                            : value.updateRecord(context, model);
                      },
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          // backgroundColor:
                          //     MaterialStateProperty.all<Color>(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(color: Colors.blue)))),
                      child: model == null
                          ? Text('Add New Record')
                          : Text('Update Record'),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
