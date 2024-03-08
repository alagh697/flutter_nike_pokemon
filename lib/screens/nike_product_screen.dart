import 'package:flutter/material.dart';

class NikeProductScreen extends StatefulWidget {
  const NikeProductScreen({super.key});

  @override
  State<NikeProductScreen> createState() => _NikeProductScreenState();
}

class _NikeProductScreenState extends State<NikeProductScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Nike product')),
    );
  }
}