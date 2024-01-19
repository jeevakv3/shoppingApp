class AddCartResponse {
  int? id;
  String? pid;
  String? name;
  String? salerate;

  AddCartResponse({
    this.id,
    this.pid,
    this.name,
    this.salerate,
  });

  factory AddCartResponse.fromJson(Map<String, dynamic> json) {
    return AddCartResponse(
      id: json['id'] as int,
      pid: json['pid'] as String,
      name: json['name'] as String,
      salerate: json['salerate'] as String,
    );
  }
}
