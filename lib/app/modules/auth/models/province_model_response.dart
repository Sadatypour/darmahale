class ProvinceModelResponse {
  int? xProvinceIdPk;
  String? xProvinceName;

  ProvinceModelResponse({this.xProvinceIdPk, this.xProvinceName});

  ProvinceModelResponse.fromJson(Map<String, dynamic> json) {
    xProvinceIdPk = json['xProvinceIdPk'];
    xProvinceName = json['xProvinceName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xProvinceIdPk'] = this.xProvinceIdPk;
    data['xProvinceName'] = this.xProvinceName;
    return data;
  }
}
