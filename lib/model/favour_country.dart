class FavourCountry {
  List<String>? favourCountry;

  FavourCountry({
    this.favourCountry,
  });

  FavourCountry.fromJson(Map<String, dynamic> json) {
    favourCountry = json['favourCountry']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favourCountry'] = favourCountry;
    return data;
  }
}
