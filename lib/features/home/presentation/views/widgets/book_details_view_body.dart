import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/size_manager.dart';
import 'action_buttons.dart';
import 'book_details_section.dart';
import 'book_details_view_app_bar.dart';

import 'similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: SizeManager.s30),
              child: Column(
                children: [
                  const BookDetailsViewAppBar(),
                  BookDetailsSection(bookEntity: bookEntity),
                  const SizedBox(height: SizeManager.s30),
                  ActionButtons(price: bookEntity.price!.toDouble()),
                  const Expanded(child: SizedBox(height: SizeManager.s30)),
                  const SimilarBooksSection(),
                  const SizedBox(height: SizeManager.s25),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
