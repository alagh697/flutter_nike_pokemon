import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  List<dynamic> pokemons = [];

  @override
  void initState(){
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    // This example uses Pokémon API to search for pokémon.
  // https://pokeapi.co/api/v2/pokemon/
  var url = Uri.https('pokeapi.co', '/api/v2/pokemon');

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
        // print(jsonResponse);
    var itemCount = jsonResponse['count'];
    setState(() {
      pokemons = jsonResponse['results'];
    });
    // print('Number of books about http: $itemCount.');
    // print('jsonResp: ${jsonResponse['results']}.');
    print('poke: ${pokemons}.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
      
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokémon'),
      ),
      body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: 
            // Text('data')
            ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pokemons[index]['name']),
          );
  }),
)
             
);
  }
}

