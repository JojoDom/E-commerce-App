import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries/providers/kyc_provider.dart';

class ImageView extends ConsumerStatefulWidget {
  const ImageView({Key? key}) : super(key: key);

  @override
  ConsumerState<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends ConsumerState<ImageView> {
  @override
  Widget build(BuildContext context) {
    final  firstname = ref.watch(firstNameProvider);
    final surName = ref.watch(surNameProvider);
    final cardImage = ref.watch(imageFrontProvider);
    final cardDetails = ref.watch(cardDetailsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Captured Details')),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            Image.file(File(cardImage!.path), height: 500),
            Text('Surname : $surName'),
             Text('FirstName : $firstname'),
          ],
        ),
      ),
    );
  }
}