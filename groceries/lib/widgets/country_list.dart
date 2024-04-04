import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:groceries/providers/select_country_controller.dart';
import 'package:logger/logger.dart';

class CountryList extends StatefulWidget {
  const CountryList({Key? key}) : super(key: key);

  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  final Stream<QuerySnapshot> countryList =
      FirebaseFirestore.instance.collection('countrylist').snapshots();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('countrylist')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Logger().i(doc["name"]);
        Logger().i(doc["imageUrl"]);
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: StreamBuilder(
          stream: countryList,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              Logger().i(snapshot.error);
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return ListView(
                children: snapshot.data!.docs
                    .map((DocumentSnapshot documentSnapshot) {
              Map<String, dynamic> data =
                  documentSnapshot.data()! as Map<String, dynamic>;
              return Consumer(
                builder: ((context, ref, child) {
                  return ListTile(
                    title: Text(data['name']),
                    leading: SizedBox(
                      height: 30,
                      width: 40,
                      child: CachedNetworkImage(
                        imageUrl: data['imageUrl'],
                        fit: BoxFit.contain,
                      ),
                    ),
                    onTap: () {
                      ref.read(countryListProvider.notifier).update((state) {
                        return CountryModel(data['countryCode'],
                            data['imageUrl'], data['length']);
                      });
                      Get.back();
                    },
                  );
                }),
              );
            }).toList());
          },
        ));
  }
}
