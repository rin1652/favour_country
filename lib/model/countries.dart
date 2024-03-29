class Countries {
  Name? name;
  List<String>? tld;
  String? cca2;
  String? ccn3;
  String? cca3;
  String? cioc;
  bool? independent;
  bool? unMember;
  List<String>? capital;
  List<String>? altSpellings;
  String? region;
  String? subregion;
  String? flag;
  Flags? flags;
  int? population;
  double? area;

  Countries({
    this.name,
    this.tld,
    this.cca2,
    this.ccn3,
    this.cca3,
    this.cioc,
    this.independent,
    this.unMember,
    this.capital,
    this.altSpellings,
    this.region,
    this.subregion,
    this.flag,
    this.flags,
    this.population,
  });

  Countries.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    tld = json['tld']?.cast<String>();
    cca2 = json['cca2'];
    ccn3 = json['ccn3'];
    cca3 = json['cca3'];
    cioc = json['cioc'];
    independent = json['independent'];
    unMember = json['unMember'];
    capital = json['capital']?.cast<String>();
    altSpellings = json['altSpellings']?.cast<String>();
    region = json['region'];
    subregion = json['subregion'];
    flag = json['flag'];
    flags = json['flags'] != null ? Flags.fromJson(json['flags']) : null;
    population = json['population'];
    area = json['area'];
  }
}

class Name {
  String? common;
  String? official;

  Name({
    this.common,
    this.official,
  });

  Name.fromJson(Map<String, dynamic> json) {
    common = json['common'];
    official = json['official'];
  }
}

class Flags {
  String? png;
  String? svg;
  String? alt;

  Flags({this.png, this.svg, this.alt});

  Flags.fromJson(Map<String, dynamic> json) {
    png = json['png'];
    svg = json['svg'];
    alt = json['alt'];
  }
}
