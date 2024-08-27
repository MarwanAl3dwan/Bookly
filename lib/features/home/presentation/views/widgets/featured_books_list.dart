import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/cubits/featured_books_cubit%20copy/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/size_manager.dart';
import 'custom_book_image.dart';

class FeaturedBooksList extends StatefulWidget {
  const FeaturedBooksList({
    super.key,
    required this.books,
  });

  final List<BookEntity> books;

  @override
  State<FeaturedBooksList> createState() => _FeaturedBooksListState();
}

class _FeaturedBooksListState extends State<FeaturedBooksList> {
  late final ScrollController _controller;
  int nextPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.26,
      child: ListView.builder(
        controller: _controller,
        itemCount: widget.books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: index == 0
                ? const EdgeInsets.only(right: SizeManager.s12)
                : const EdgeInsets.only(
                    right: SizeManager.s12,
                    top: SizeManager.s12,
                    bottom: SizeManager.s12,
                  ),
            child: CustomBookImage(
              image: widget.books[index].image ?? '',
            ),
          );
        },
      ),
    );
  }

  void _scrollListener() async {
    double currentPosition = _controller.position.pixels;
    double maxScrollLength = _controller.position.maxScrollExtent;

    if (currentPosition >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchFeaturedBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }
}
