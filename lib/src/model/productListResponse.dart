class ProductListResponse {
  String? s0;
  String? s1;
  String? s2;
  String? pid;
  String? name;
  String? salerate;

  ProductListResponse(
      {this.s0, this.s1, this.s2, this.pid, this.name, this.salerate});

  ProductListResponse.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
    s2 = json['2'];
    pid = json['pid'];
    name = json['name'];
    salerate = json['salerate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.s0;
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['pid'] = this.pid;
    data['name'] = this.name;
    data['salerate'] = this.salerate;
    return data;
  }
}
