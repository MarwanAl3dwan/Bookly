import 'package:bookly/core/utils/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/styles_manager.dart';
import 'custom_search_field.dart';
import 'search_result_list.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeManager.s30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: SizeManager.s20),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).pop();
                },
                child: const Icon(Icons.arrow_back, size: SizeManager.s30),
              ),
              const SizedBox(width: 10),
              const Expanded(child: CustomSearchField()),
            ],
          ),
          const SizedBox(height: SizeManager.s16),
          const Text('Search Result', style: StylesManager.textStyle16),
          const SizedBox(height: SizeManager.s10),
          const SearchResultList(),
        ],
      ),
    );
  }
}
