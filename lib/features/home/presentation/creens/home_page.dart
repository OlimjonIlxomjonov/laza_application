import 'package:flutter/material.dart';
import 'package:laza_applicaiton/core/common/widgets/app_bar/action_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ActionAppBar(onPressed: () {}),
      body: Column(children: []),
    );
  }
}
