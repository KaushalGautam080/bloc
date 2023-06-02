import 'package:flutter/material.dart';
import 'package:flutter_blc/bloc/internet/internet_state.dart';
import 'package:flutter_blc/bloc/internet_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BLOCK"),
      ),
      body: Center(
        child: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            if (state is InternetLossState) {
              return const Text("No Connection");
            } else if (state is InternetGainedState) {
              return const Text("Connection");
            } else {
              return const Text("Loading...");
            }
          },
        ),
      ),
    );
  }
}
