import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/size_manager.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: SizeManager.s20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AssetsManager.logoPath, height: SizeManager.s20),
          IconButton(
            onPressed: () => navigateToSearchView(context),
            icon: const Icon(FontAwesomeIcons.magnifyingGlass),
          ),
        ],
      ),
    );
  }

  void navigateToSearchView(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).push(AppRouter.searchView);
    });
  }
}
