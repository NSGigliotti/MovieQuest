import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviequest/controllers/login_controller.dart';
import 'package:moviequest/controllers/navigation_controller.dart';
import 'package:moviequest/ui/core/theme/theme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final NavigationController navigationController = NavigationController();

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<LoginController>(context);

    AppTheme appTheme = AppTheme();
    return Observer(
      builder: (_) => userController.isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              decoration: appTheme.homeScreen,
              child: Scaffold(
                appBar: AppBar(
                  title: Text("Movie Quest"),
                ),
                backgroundColor: Colors.transparent,
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: navigationController
                      .selectedIndex, // Indica o índice atual
                  onTap: navigationController.onItemTapped,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.score),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: '',
                    ),
                  ],
                ),
                body: navigationController
                    .screenList[navigationController.selectedIndex],
              ),
            ),
    );
  }
}
