

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries/providers/kyc_provider.dart';
import 'package:groceries/utilities/helper.dart';

class VerifyAccountDetails extends ConsumerStatefulWidget {
  const VerifyAccountDetails({Key? key}) : super(key: key);

  @override
  ConsumerState<VerifyAccountDetails> createState() =>
      _VerifyAccountDetailsState();
}

class _VerifyAccountDetailsState extends ConsumerState<VerifyAccountDetails> {
  @override
  Widget build(BuildContext context) {
    
    final cardImage = ref.watch(cardImageProvider);
    final cardDetails = ref.watch(cardDetailsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Captured Details')),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            Image.file(File(cardImage!.path), height: 500),

            // Text('Surname : ${cardDetails[0]}'),
            // Text('First Name(s) : ${cardDetails[1]}'),
            // Text('Nationality: ${cardDetails[2]}'),
            // Text('Date of Birth : ${Helper().formatDate(cardDetails[3].replaceAll('/', ''))}'),
            // Text('Ghana card number : ${cardDetails[4]}'),
            // Text('Document Number : ${cardDetails[5]}'),
            // Text('Date of issuance : ${Helper().formatDate(cardDetails[7].replaceAll('/', ''))}'),
            // Text('Date of Expiry : ${Helper().formatDate(cardDetails[8].replaceAll('/', ''))}'),

       const SizedBox(height: 20),

            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                return Text(cardDetails[index]);
              }), separatorBuilder: ((context, index) => const SizedBox(height: 2,)), 
              itemCount: cardDetails.length),
            )
            
         
          
          ],
        ),
      ),
    );
  }
}
