import 'package:flutter/material.dart';
import 'package:flutter_blc/cubit/internet_cubit.dart';
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
        child: BlocBuilder<InternetCubit, InternetState>(
          builder: (context, state) {
            if (state == InternetState.loss) {
              return const Text("No Connection");
            } else if (state == InternetState.gain) {
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
