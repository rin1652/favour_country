import 'package:flutter/material.dart';
import 'package:login_with_firebase/model/countries.dart';

class DetailCountry extends StatelessWidget {
  final Countries country;

  const DetailCountry({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(country.name!.common.toString()),
        ),
        body: Column(
          children: [
            Image.network(
              country.flags!.png.toString(),
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              'Capital: ${country.capital!.first}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              'Region: ${country.region}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              'Subregion: ${country.subregion}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              'Population: ${convertNumber(country.population ?? 0)} people',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              'Area: ${convertNumber((country.area ?? 0).toInt())} km²',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ));
  }

  String convertNumber(int number) {
    if (number == 0) return "Unknown";
    return number.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match match) => '${match[1]}.',
        );
  }
}
