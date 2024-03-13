// ignore_for_file: unused_local_variable

import 'package:debt_simplification/debt_simplification.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Debt Simplification Example',
      home: ShowToast(),
    );
  }
}

class ShowToast extends StatelessWidget {
  const ShowToast({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debt Simplification Example'),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          List<Map<String, Map<String, int>>> initialDebts = [
            {
              "Alice": {
                "Bob": 10,
                "Charlie": 5,
              } // Bob owes Alice 10, Charlie owes Alice 5
            },
            {
              "Bob": {
                "Alice": 2,
                "Charlie": 3,
              } // Alice owes Bob 2, Charlie owes Bob 3
            },
            {
              "Charlie": {
                "Alice": 7,
              } // Alice owes Charlie 7
            }
          ];

          List simplifiedDebts = DebtSimplification.simplify(initialDebts);
        },
        child: const Text('Get Simplified Debts'),
      )),
    );
  }
}
