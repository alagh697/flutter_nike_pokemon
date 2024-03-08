import 'package:flutter/material.dart';
import 'package:flutter_nike_pokemon/screens/nike_product_screen.dart';
import 'package:flutter_sanity/flutter_sanity.dart';

class NikeScreen extends StatefulWidget {
  const NikeScreen({super.key});

  @override
  State<NikeScreen> createState() => _NikeScreenState();
}

class _NikeScreenState extends State<NikeScreen> {
   String buttonName = "Click";
  int currentIndex = 0;

  @override
  void initState(){
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final sanityclient = SanityClient(
      projectId: 'ruo5dylw', 
      dataset:'production',);

      final response = await sanityclient.fetch('*[_type=="product"]{ name }');

      if(response != null && response.isNotEmpty) {
        print('data: ${response}');
      }
      else
      {
        print('nothing');
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Nike')),
        ),
        body: Center(
          child: currentIndex == 0 ? 
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black12,

            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                
              ),
                  onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return const NikeProductScreen();
              }));
              
            },
              child: Text('Navigate'),
            ),
            GestureDetector(
              onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return const NikeProductScreen();
              }));
              
            },
            child: Image.asset('images/Akuma.jpg'),
            )
            
                    ]),
          )
          :
          Container(
            child: Text('Pokémon')
          )
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: 'Nike',
              icon: Icon(Icons.sports_basketball)
              ),
            BottomNavigationBarItem(
              label: 'Pokémon',
              icon: Icon(Icons.pets,
              // color: Colors.red,
              size: 24.0
              )
              ),
              ],
              currentIndex: currentIndex,
              onTap: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
        ),
      );
  }
}