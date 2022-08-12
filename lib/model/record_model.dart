class RecordModel {
  int? id;
  int? status;
  String? cammand;
  String? timevalue;
  String? description;
  String? commandruntime;

  RecordModel(
      {this.id,
      this.status,
      this.cammand,
      this.timevalue,
      this.description,
      this.commandruntime});

  static RecordModel fromJson(Map<String, dynamic> json) => RecordModel(
        id: json['id'],
        status: json['status'],
        cammand: json['cammand'],
        timevalue: json['timevalue'],
        description: json['description'],
        commandruntime: json['commandruntime'],
      );
}
