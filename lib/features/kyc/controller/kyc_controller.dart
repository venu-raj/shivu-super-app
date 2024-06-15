import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shiv_super_app/core/utils/snack_bar.dart';
import 'package:shiv_super_app/features/kyc/model/kyc_model.dart';
import 'package:shiv_super_app/features/kyc/repository/kyc_repositry.dart';

final kYCControllerProvider = StateNotifierProvider<KYCController, bool>((ref) {
  return KYCController(kycReository: ref.watch(kYCReositoryProvider));
});

class KYCController extends StateNotifier<bool> {
  final KYCReository kycReository;

  KYCController({
    required this.kycReository,
  }) : super(false);

  void uploadKYCDetails({
    required KYCModel kycModel,
    required BuildContext context,
  }) async {
    state = true;
    final res = await kycReository.uploadKYCDetails(
      kycModel: kycModel,
    );
    state = false;

    res.fold(
      (l) => showSnackBar(context, l.text),
      (r) => Navigator.of(context).pop(),
    );
  }
}
