import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shiv_super_app/features/partners/models/teams_model.dart';

class PartnerDetailsScreen extends ConsumerWidget {
  final TeamsModel teamsModel;
  const PartnerDetailsScreen({
    required this.teamsModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
