import 'package:auto_route/annotations.dart';
import 'package:estem/features/main/ui/wallet/ui/transfer/widgets/transfer_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/wallet_card.dart';
import 'bloc/transfer_bloc.dart';
import 'bloc/transfer_state.dart';

@RoutePage()
class TransferScreen extends StatelessWidget {
  const TransferScreen({
    super.key,
    required this.type,
    required this.wallet,
    this.card,
  });

  final TransferType type;
  final WalletCard wallet;
  final WalletCard? card;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransferBloc(
        type: type,
        wallet: wallet,
        card: card,
      ),
      child: const TransferBody(),
    );
  }
}
