import 'package:flutter/material.dart';
import 'package:server_app/model/server_model.dart';
import 'package:server_app/screens/controllers/sql_helper.dart';

class ServerProvider extends ChangeNotifier {
  final TextEditingController _snameController = TextEditingController();
  TextEditingController get snameController => _snameController;

  final TextEditingController _hController = TextEditingController();
  TextEditingController get hController => _hController;

  final TextEditingController _apiController = TextEditingController();
  TextEditingController get apiController => _apiController;

  final TextEditingController _portController = TextEditingController();
  TextEditingController get portController => _portController;

  Future<void> addNewServer(BuildContext context) async {
    if (_snameController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Fill the field")));
    } else if (_hController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Fill the field")));
    } else if (_apiController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Fill the field")));
    } else if (_portController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Fill the field")));
    } else {
      var i = await SqlHelper.createServer(
        _snameController.text,
        _hController.text,
        _apiController.text,
        _portController.text,
      );
      clearControllers();
      await refreservers();
      Navigator.pop(context);
    }

    notifyListeners();
  }

  void clearControllers() {
    _snameController.clear();
    _hController.clear();
    _apiController.clear();
    _portController.clear();
  }

  List<ServerModel> _allServers = [];
  List<ServerModel> get allServers => _allServers;

  Future<void> refreservers() async {
    _allServers = await SqlHelper.getServers();
    notifyListeners();
    print("object");
  }

  Future<void> deleteRoom(BuildContext context, int id, String name) async {
    await SqlHelper.deleteServer(id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("You deleted Server $name"),
      ),
    );
    await refreservers();

    notifyListeners();
  }

  void setTextControllers(ServerModel model) {
    _snameController.text = model.name.toString();
    _hController.text = model.host.toString();
    _apiController.text = model.api.toString();
    _portController.text = model.port.toString();
    notifyListeners();
  }

  Future<void> updateSever(BuildContext context, ServerModel model) async {
    var i = await SqlHelper.updateServer(
      model.id!.toInt(),
      _snameController.text.toString(),
      _hController.text.toString(),
      _apiController.text.toString(),
      _portController.text.toString(),
    );

    clearControllers();
    await refreservers();
    notifyListeners();
    Navigator.pop(context);
  }
}
