import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import './counter_provider.dart';
import './score.dart';

class Counter extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //  Text('Count: $count'),
        ElevatedButton(
            onPressed: () {
              ref.read(counterProvider.notifier).increment();
            },
            child: Text('Increment')),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Score()),
            );
          },
          child: Text('View Score'),
        ),
      ],
    );
  }
}

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Counter App',
        home: Counter(),
      ),
    ),
  );
}
