import 'package:flutter/material.dart';

import '../../models/food_model.dart';
import '../../widgets/food_item_widget.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Fruits'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: ListView.builder(
            itemCount: veggies.length,
            itemBuilder: ((context, index) {
              return 
              ListTile(title: Text(veggies[index].title),
              leading: Container(
                height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Image.asset(veggies[index].image),),
        
              );
            }),
          ),
        ));
  }
}
