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
          actions: [
            InkWell(
              onTap: () {
                fruits.add(veggies[0]);
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.green),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: ListView.separated(
            itemCount: fruits.length,
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text(fruits[index].title),
                leading: Container(
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: Image.asset(fruits[index].image),
                ),
              );
            }),
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.grey,
              );
            },
          ),
        ));
  }
}
