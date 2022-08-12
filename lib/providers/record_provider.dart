import 'package:flutter/material.dart';
import 'package:server_app/model/record_model.dart';
import 'package:server_app/model/server_model.dart';
import 'package:server_app/screens/controllers/sql_helper.dart';

class RecordProvider extends ChangeNotifier {
  final TextEditingController _statusController = TextEditingController();
  TextEditingController get statusController => _statusController;

  final TextEditingController _cammandController = TextEditingController();
  TextEditingController get cammandController => _cammandController;

  final TextEditingController _timeController = TextEditingController();
  TextEditingController get timeController => _timeController;

  final TextEditingController _desController = TextEditingController();
  TextEditingController get desController => _desController;

  final TextEditingController _runtimeController = TextEditingController();
  TextEditingController get runtimeController => _runtimeController;

  Future<void> addNewRecord(BuildContext context) async {
    //showing a snackbar if title empty
    if (_statusController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Fill the field")));
    } else if (_cammandController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Fill the field")));
    } else if (_timeController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Fill the field")));
    } else if (_desController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Fill the field")));
    } else if (_runtimeController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Fill the field")));
    } else {
      var i = await SqlHelper.createRecords(
        _statusController.text,
        _cammandController.text,
        _timeController.text,
        _desController.text,
        _runtimeController.text,
      );
      clearControllers();
      await refreRecords();
      Navigator.pop(context);
    }

    notifyListeners();
  }

  void clearControllers() {
    _statusController.clear();
    _cammandController.clear();
    _timeController.clear();
    _desController.clear();
    _runtimeController.clear();
  }

  List<RecordModel> _allRecords = [];
  List<RecordModel> get allRecords => _allRecords;

  Future<void> refreRecords() async {
    _allRecords = await SqlHelper.getRecords();
    notifyListeners();
  }

  Future<void> deleteRoom(BuildContext context, int id, String name) async {
    await SqlHelper.deleteServer(id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("You deleted Server $name"),
      ),
    );
    await refreRecords();

    notifyListeners();
  }

  void setTextControllers(RecordModel model) {
    _statusController.text = model.status.toString();
    _cammandController.text = model.cammand.toString();
    _timeController.text = model.timevalue.toString();
    _desController.text = model.description.toString();
    _runtimeController.text = model.description.toString();

    notifyListeners();
  }

  Future<void> updateRecord(BuildContext context, RecordModel model) async {
    var i = await SqlHelper.updateRecords(
      model.id!.toInt(),
      _statusController.text.toString(),
      _cammandController.text.toString(),
      _timeController.text.toString(),
      _desController.text.toString(),
      _runtimeController.text.toString(),
    );
    print(i);

    clearControllers();
    await refreRecords();
    notifyListeners();
    Navigator.pop(context);
  }
}
