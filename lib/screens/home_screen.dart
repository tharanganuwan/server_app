import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:server_app/components/custom_form.dart';
import 'package:server_app/providers/server_provider.dart';
import 'package:server_app/screens/records_screen.dart';
import 'package:server_app/utils/util_function.dart';
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
          title: const Text('Server List'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              value.clearControllers();
              ShowForm.showForm(context, null);
            },
            backgroundColor: Color.fromARGB(255, 168, 86, 194),
            icon: const Icon(Icons.add),
            label: const Text(
              'Create Server',
            )),
        body: ListView.separated(
            padding: EdgeInsets.all(15),
            physics: BouncingScrollPhysics(),
            itemBuilder: ((context, index) {
              return ListCard(
                onTap: () {
                  UtilFunction.navigateTo(context, RecordsScreen());
                },
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
}
