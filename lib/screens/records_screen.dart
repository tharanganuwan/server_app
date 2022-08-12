import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:server_app/components/custome_textfield.dart';
import 'package:server_app/model/server_model.dart';
import 'package:server_app/widgets/listrecords_card.dart';

import '../components/custom_record_form .dart';
import '../providers/record_provider.dart';
import '../widgets/listserver_card.dart';
import '../widgets/record_card.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({
    Key? key,
    required this.model,
  }) : super(key: key);
  final ServerModel model;
  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  @override
  Widget build(BuildContext context) {
    return (Consumer<RecordProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text('Records'),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Status  :     ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Switch(
                      value: (value.status == 0) ? false : true,
                      onChanged: (bool stste) {
                        setState(() {
                          if (stste == true) {
                            value.setStatus(1);
                          } else {
                            value.setStatus(0);
                          }
                        });
                      },
                    ),
                  ],
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
                      value.updateRecord(context, widget.model);
                    },
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.blue)))),
                    child: Text('Update Record'))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
