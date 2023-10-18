import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_watch_ui/data/bloc/cart_bloc/cart_bloc.dart';

import '../repositories/cart_repository.dart';

class BlocWidget extends StatelessWidget {
  final Widget child;
  const BlocWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CartRepositoryImpl(),
      child: BlocProvider(
        create: (context) => CartBloc(
            cartRepository: RepositoryProvider.of<CartRepositoryImpl>(context)),
        child: child,
      ),
    );
  }
}
