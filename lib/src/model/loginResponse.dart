class LoginResponse {
  String? s0;
  String? s1;
  String? s2;
  String? s3;
  String? s4;
  String? s5;
  String? s6;
  String? s7;
  String? s8;
  String? custid;
  String? name;
  String? state;
  String? country;
  String? companyId;
  String? custype;
  String? custtypeid;
  String? phone1;
  String? brid;

  LoginResponse(
      {this.s0,
      this.s1,
      this.s2,
      this.s3,
      this.s4,
      this.s5,
      this.s6,
      this.s7,
      this.s8,
      this.custid,
      this.name,
      this.state,
      this.country,
      this.companyId,
      this.custype,
      this.custtypeid,
      this.phone1,
      this.brid});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
    s6 = json['6'];
    s7 = json['7'];
    s8 = json['8'];
    custid = json['custid'];
    name = json['name'];
    state = json['state'];
    country = json['country'];
    companyId = json['company_id'];
    custype = json['custype'];
    custtypeid = json['custtypeid'];
    phone1 = json['phone1'];
    brid = json['brid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.s0;
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    data['5'] = this.s5;
    data['6'] = this.s6;
    data['7'] = this.s7;
    data['8'] = this.s8;
    data['custid'] = this.custid;
    data['name'] = this.name;
    data['state'] = this.state;
    data['country'] = this.country;
    data['company_id'] = this.companyId;
    data['custype'] = this.custype;
    data['custtypeid'] = this.custtypeid;
    data['phone1'] = this.phone1;
    data['brid'] = this.brid;
    return data;
  }
}
