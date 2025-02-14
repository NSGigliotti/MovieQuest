import 'package:flutter/material.dart';
import 'package:moviequest/ui/core/theme/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.homeScreen,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Movie Quest"),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
