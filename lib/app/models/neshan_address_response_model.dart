class NeshanAddressResponseModel {
  String? status;
  String? formattedAddress;
  String? routeName;
  String? routeType;
  String? neighbourhood;
  String? city;
  String? state;
  String? place;
  String? municipalityZone;
  bool? inTrafficZone;
  bool? inOddEvenZone;
  String? village;
  String? county;
  String? district;

  NeshanAddressResponseModel(
      {this.status,
      this.formattedAddress,
      this.routeName,
      this.routeType,
      this.neighbourhood,
      this.city,
      this.state,
      this.place,
      this.municipalityZone,
      this.inTrafficZone,
      this.inOddEvenZone,
      this.village,
      this.county,
      this.district});

  NeshanAddressResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    formattedAddress = json['formatted_address'];
    routeName = json['route_name'];
    routeType = json['route_type'];
    neighbourhood = json['neighbourhood'];
    city = json['city'];
    state = json['state'];
    place = json['place'];
    municipalityZone = json['municipality_zone'];
    inTrafficZone = json['in_traffic_zone'];
    inOddEvenZone = json['in_odd_even_zone'];
    village = json['village'];
    county = json['county'];
    district = json['district'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['formatted_address'] = this.formattedAddress;
    data['route_name'] = this.routeName;
    data['route_type'] = this.routeType;
    data['neighbourhood'] = this.neighbourhood;
    data['city'] = this.city;
    data['state'] = this.state;
    data['place'] = this.place;
    data['municipality_zone'] = this.municipalityZone;
    data['in_traffic_zone'] = this.inTrafficZone;
    data['in_odd_even_zone'] = this.inOddEvenZone;
    data['village'] = this.village;
    data['county'] = this.county;
    data['district'] = this.district;
    return data;
  }
}
