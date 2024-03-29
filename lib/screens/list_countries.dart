import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:login_with_firebase/model/countries.dart';
import 'package:login_with_firebase/model/favour_country.dart';
import 'package:login_with_firebase/screens/detail_country.dart';

class ListCountries extends StatefulWidget {
  const ListCountries({super.key});

  @override
  State<ListCountries> createState() => _ListCountriesState();
}

class _ListCountriesState extends State<ListCountries> {
  final dio = Dio();
  final firebaseFirestore = FirebaseFirestore.instance;
  final authenticatedUser = FirebaseAuth.instance.currentUser!;

  List<Countries>? listCountry;
  List<String> listCountryNameFavour = [];
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _readListALlCountry();
    _readListFavourOnFireBase(authenticatedUser.email ?? "");
    _searchController.addListener(() async {
      await _onChange(_searchController.text);
      setState(() {});
    });
  }

  Future<void> _readListALlCountry() async {
    final response = await dio.get('https://restcountries.com/v3.1/all');
    listCountry = response.data
        .map<Countries>((json) => Countries.fromJson(json))
        .toList();
    setState(() {});
  }

  Future<void> _readListFavourOnFireBase(String email) async {
    try {
      final listFavour =
          await firebaseFirestore.collection('likecountry').doc(email).get();

      print("listCountryNameFavour: ${listFavour.runtimeType}");

      final FavourCountry favourCountry =
          FavourCountry.fromJson(listFavour.data() as Map<String, dynamic>);
      listCountryNameFavour = favourCountry.favourCountry ?? [];
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listCountry == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: listCountry!.length,
                    itemBuilder: (context, index) {
                      final country = listCountry![index];
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () => _goRouter(country),
                          child: Card(
                            child: ListTile(
                              leading: SizedBox(
                                width: 100,
                                height: 50,
                                child: Image.network("${country.flags?.png}"),
                              ),
                              title: Text("${country.name?.common.toString()}"),
                              subtitle:
                                  Text("Capital: ${country.capital?.first}"),
                              trailing: _buildFavour(
                                  country.name?.common ?? "",
                                  listCountryNameFavour
                                      .contains(country.name?.common)),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  _buildFavour(String name, bool isFavour) {
    return IconButton(
      onPressed: () async {
        if (isFavour) {
          listCountryNameFavour.remove(name);
        } else {
          listCountryNameFavour.add(name);
        }
        final favourCountry =
            FavourCountry(favourCountry: listCountryNameFavour);
        await firebaseFirestore
            .collection('likecountry')
            .doc(authenticatedUser.email)
            .set(favourCountry.toJson());
        setState(() {});
      },
      icon: isFavour
          ? const Icon(
              Icons.star,
              color: Colors.amber,
            )
          : const Icon(
              Icons.star,
              color: Colors.black26,
            ),
    );
  }

  _onChange(String value) async {
    final response =
        await dio.get('https://restcountries.com/v3.1/name/$value');
    listCountry = await response.data
        .map<Countries>((json) => Countries.fromJson(json))
        .toList();
    setState(() {});
  }

  _goRouter(Countries country) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailCountry(country: country),
      ),
    );
  }
}
