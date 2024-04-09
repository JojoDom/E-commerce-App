import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries/providers/kyc_provider.dart';
import 'package:groceries/screens/onboarding/capture_id.dart';
import 'package:groceries/screens/onboarding/image_preview.dart';

class Onboarding extends ConsumerStatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  ConsumerState<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends ConsumerState<Onboarding> {
  @override
  Widget build(BuildContext context) {
    final kycProgress = ref.watch(kycProgressProvider);
    return  kycProgress == 0?  
    const CaptureID():
      kycProgress == 1? const ImageView() : const CircularProgressIndicator();
  }
}