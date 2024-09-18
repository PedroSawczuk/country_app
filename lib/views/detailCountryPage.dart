import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:paises_app/models/countryModel.dart';

class DetailCountryPage extends StatelessWidget {
  final CountryModel country;

  const DetailCountryPage({
    Key? key,
    required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          country.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green.shade800,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Image.network(country.flag),
              SizedBox(
                height: 10,
              ),
              Text(
                country.name,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                country.region,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Population: ${country.population}',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  _launchUrl(country.googleMaps);
                },
                child: Text('Ver pais no GoogleMaps'),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade800,
                  foregroundColor: Colors.white,
                  fixedSize: Size(240, 40),
                ),
                onPressed: () {},
                label: Text('Adicionar aos Favoritos'),
                icon: Icon(
                  Icons.favorite,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Não foi possível abrir o link: $url';
  }
}
