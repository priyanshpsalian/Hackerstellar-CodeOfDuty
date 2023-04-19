import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rive_animation/api/stockmarketApi.dart';

class funCall extends StatelessWidget {
  const funCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        child: Text("Click"),
        onPressed: () => {
          makeRequest(),
          //getConferences()
        },
      ),
    );
  }
}
