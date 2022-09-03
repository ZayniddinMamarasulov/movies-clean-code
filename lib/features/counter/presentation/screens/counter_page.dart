import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample2/features/counter/presentation/bloc/counter_cubit.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Page'),
      ),
      body: Center(child: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Text(
            state.toString(),
            style: TextStyle(fontSize: 32),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterCubit>().increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
