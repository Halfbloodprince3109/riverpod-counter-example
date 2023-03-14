import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter/counter_provider.dart';
import 'package:state_notifier/state_notifier.dart';
import './main.dart' as prefix;

class ScoreState extends StateNotifier<int> {
  ScoreState() : super(0);

  void setScore(int score) {
    if (mounted) {
      state = score;
    }
  }
}

final scoreStateProvider = StateNotifierProvider((ref) => ScoreState());

class Score extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Score'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (context, ref, _) {
              final score = ref.watch(counterProvider);
              return Text(
                'Score: $score',
                style: TextStyle(fontSize: 50),
              );
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

// class Score extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Score'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Consumer(builder: (context, watch, _) {
//               final count = watch(counterStateProvider.state);
//               return Text(
//                 'Score: $count',
//                 style: TextStyle(fontSize: 50),
//               );
//             }),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Go Back'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }