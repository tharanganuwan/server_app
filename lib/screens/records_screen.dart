import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:server_app/components/custome_textfield.dart';
import 'package:server_app/widgets/listrecords_card.dart';

import '../components/custom_record_form .dart';
import '../providers/record_provider.dart';
import '../widgets/listserver_card.dart';
import '../widgets/record_card.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({Key? key}) : super(key: key);

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  @override
  Widget build(BuildContext context) {
    return (Consumer<RecordProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text('Records List'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              value.clearControllers();
              ShowRecordForm.showForm(context, null);
            },
            backgroundColor: Color.fromARGB(255, 168, 86, 194),
            icon: Icon(Icons.add),
            label: Text(
              'Create Records',
            )),
        body: ListView.separated(
            padding: EdgeInsets.all(15),
            physics: BouncingScrollPhysics(),
            itemBuilder: ((context, index) {
              return ListRecordCard(model: value.allRecords[index]);
            }),
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10,
              );
            },
            itemCount: value.allRecords.length),
      ),
    ));
  }
  // void _showForm() {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (_) {
  //         return Container(
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           child: Padding(
  //             padding: const EdgeInsets.all(10.0),
  //             child: Column(
  //               children: [
  //                 CustomTextField(
  //                   hintText: 'Status',
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 CustomTextField(
  //                   hintText: 'Cammand',
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 CustomTextField(
  //                   hintText: 'Time Value',
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 CustomTextField(
  //                   hintText: 'Description',
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 CustomTextField(
  //                   hintText: 'Cammand Run Time',
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 ElevatedButton(
  //                     onPressed: () {},
  //                     style: ButtonStyle(
  //                         foregroundColor:
  //                             MaterialStateProperty.all<Color>(Colors.white),
  //                         // backgroundColor:
  //                         //     MaterialStateProperty.all<Color>(Colors.red),
  //                         shape:
  //                             MaterialStateProperty.all<RoundedRectangleBorder>(
  //                                 RoundedRectangleBorder(
  //                                     borderRadius: BorderRadius.circular(10),
  //                                     side: BorderSide(color: Colors.blue)))),
  //                     child: Text('Add New Record'))
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

}
