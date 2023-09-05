import 'package:flutter/material.dart';

import './splash.dart';
import '../../mixins/mixins.dart';

class SplashPage extends StatelessWidget with NavigationManager {
  final SplashPresenter presenter;

  SplashPage({super.key, required this.presenter});

  @override
  Widget build(BuildContext context) {
    presenter.checkAccount();

    return Scaffold(
      appBar: AppBar(title: const Text('Tattoo Manager')),
      body: Builder(
        builder: (context) {
          handleNavigation(presenter.navigateToStream, clear: true);

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
