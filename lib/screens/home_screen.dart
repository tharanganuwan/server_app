import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:server_app/components/custom_form.dart';
import 'package:server_app/components/custome_textfield.dart';
import 'package:server_app/providers/server_provider.dart';
import 'package:server_app/widgets/listserver_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<ServerProvider>(context, listen: false).refreservers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Consumer<ServerProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text('Server List'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              value.clearControllers();
              ShowForm.showForm(context, null);
            },
            backgroundColor: Color.fromARGB(255, 168, 86, 194),
            icon: Icon(Icons.add),
            label: Text(
              'Create Server',
            )),
        body: ListView.separated(
            padding: EdgeInsets.all(15),
            physics: BouncingScrollPhysics(),
            itemBuilder: ((context, index) {
              return ListCard(
                model: value.allServers[index],
              );
            }),
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10,
              );
            },
            itemCount: value.allServers.length),
      ),
    ));
  }

  //  void _showForm() {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (_) {
  //         return Consumer<ServerProvider>(
  //           builder: (context, value, child) => Container(
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //             child: Padding(
  //               padding: const EdgeInsets.all(10.0),
  //               child: Column(
  //                 children: [
  //                   CustomTextField(
  //                     hintText: 'Server Name',
  //                     controller: value.snameController,
  //                   ),
  //                   SizedBox(
  //                     height: 10,
  //                   ),
  //                   CustomTextField(
  //                     hintText: 'Host',
  //                     controller: value.hController,
  //                   ),
  //                   SizedBox(
  //                     height: 10,
  //                   ),
  //                   CustomTextField(
  //                     hintText: 'api forlder',
  //                     controller: value.apiController,
  //                   ),
  //                   SizedBox(
  //                     height: 10,
  //                   ),
  //                   CustomTextField(
  //                     hintText: 'port',
  //                     controller: value.portController,
  //                   ),
  //                   ElevatedButton(
  //                       onPressed: () {
  //                         value.addNewServer(context);
  //                       },
  //                       style: ButtonStyle(
  //                           foregroundColor:
  //                               MaterialStateProperty.all<Color>(Colors.white),
  //                           // backgroundColor:
  //                           //     MaterialStateProperty.all<Color>(Colors.red),
  //                           shape: MaterialStateProperty.all<
  //                                   RoundedRectangleBorder>(
  //                               RoundedRectangleBorder(
  //                                   borderRadius: BorderRadius.circular(10),
  //                                   side: BorderSide(color: Colors.blue)))),
  //                       child: Text('Add New Server'))
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }
}
