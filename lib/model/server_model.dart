class ServerModel {
  int? id;
  String? name;
  String? host;
  String? api;
  String? port;

  ServerModel({this.id, this.name, this.host, this.api, this.port});

  static ServerModel fromJson(Map<String, dynamic> json) => ServerModel(
        id: json['id'],
        name: json['name'],
        host: json['host'],
        api: json['api'],
        port: json['port'],
      );
}
