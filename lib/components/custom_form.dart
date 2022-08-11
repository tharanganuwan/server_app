import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:server_app/components/custome_textfield.dart';
import 'package:server_app/model/server_model.dart';
import 'package:server_app/providers/server_provider.dart';

class ShowForm {
  static void showForm(BuildContext context, ServerModel? model) {
    if (model != null) {
      Provider.of<ServerProvider>(context, listen: false)
          .setTextControllers(model);
    }
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Consumer<ServerProvider>(
            builder: (context, value, child) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: 'Server Name',
                      controller: value.snameController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: 'Host',
                      controller: value.hController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: 'api forlder',
                      controller: value.apiController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: 'port',
                      controller: value.portController,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print(model == null);
                        model == null
                            ? value.addNewServer(context)
                            : value.updateSever(context, model);
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
                          ? Text('Add New Server')
                          : Text('Update Server'),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
