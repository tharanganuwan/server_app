class ServerModel {
  int? id;
  String? name;
  String? host;
  String? api;
  String? port;
  int? status;
  String? cammand;
  String? timevalue;
  String? description;
  String? commandruntime;

  ServerModel({
    this.id,
    this.name,
    this.host,
    this.api,
    this.port,
    this.status,
    this.cammand,
    this.timevalue,
    this.description,
    this.commandruntime,
  });

  static ServerModel fromJson(Map<String, dynamic> json) => ServerModel(
        id: json['id'],
        name: json['name'],
        host: json['host'],
        api: json['api'],
        port: json['port'],
        status: json['status'],
        cammand: json['cammand'],
        timevalue: json['timevalue'],
        description: json['description'],
        commandruntime: json['commandruntime'],
      );
}
