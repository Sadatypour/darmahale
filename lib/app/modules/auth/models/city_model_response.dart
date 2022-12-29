class CityModelResponse {
  int? xCityIdPk;
  String? xCityName;

  CityModelResponse({this.xCityIdPk, this.xCityName});

  CityModelResponse.fromJson(Map<String, dynamic> json) {
    xCityIdPk = json['xCityIdPk'];
    xCityName = json['xCityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xCityIdPk'] = this.xCityIdPk;
    data['xCityName'] = this.xCityName;
    return data;
  }
}
