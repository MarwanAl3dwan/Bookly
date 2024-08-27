import 'package:flutter/material.dart';

import '../../../../../core/utils/size_manager.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: SizeManager.s20),
            // child: BookListItem(
            //   itemHeight: SizeManager.s120,
            // ),
          );
        },
      ),
    );
  }
}
