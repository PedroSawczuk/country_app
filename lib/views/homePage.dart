import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paises_app/models/countryModel.dart';
import 'package:paises_app/services/countryServices.dart';
import 'package:paises_app/views/detailCountryPage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final CountryServices _countryServices = CountryServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Paises em Portugues para visitar',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green.shade800,
      ),
      body: FutureBuilder<List<CountryModel>>(
        future: _countryServices.fetchCountryInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro! ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final countries = snapshot.data!;
            return ListView.separated(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];
                return ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: Image.network(
                    country.flag,
                    fit: BoxFit.cover,
                    width: 70,
                    height: 70,
                  ),
                  title: Text(country.name),
                  subtitle: Text(country.region),
                  onTap: () {
                    Get.to(() => DetailCountryPage(country: country));
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(),
            );
          } else {
            return Center(child: Text('Nenhum dado disponível'));
          }
        },
      ),
    );
  }
}
