import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/home/presentation/cubit/navigation_cubit.dart';
import 'package:rick_and_morty/home/presentation/widgets/home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: HomeWidget(),
    );
  }
}
