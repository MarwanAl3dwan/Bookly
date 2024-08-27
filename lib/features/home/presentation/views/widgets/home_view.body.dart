import 'package:bookly/core/utils/size_manager.dart';
import 'package:bookly/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/newest_books_cubit/newest_books_cubit.dart';
import 'featured_books_list_bloc_consumer.dart';
import 'home_view_app_bar.dart';
import 'newest_books_list_bloc_consumer.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late final ScrollController _scrollController;
  bool isLoading = false;
  int nextPage = 3;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        controller: _scrollController,
        slivers: const [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: SizeManager.s30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeViewAppBar(),
                  SizedBox(height: SizeManager.s20),
                  FeaturedBooksListBlocConsumer(),
                  SizedBox(height: SizeManager.s50),
                  Text('Newest Books', style: StylesManager.textStyle18),
                  SizedBox(height: SizeManager.s20),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: NewestBooksListBlocConsumer(),
          ),
        ],
      ),
    );
  }

  void _scrollListener() async {
    double currentPosition = _scrollController.position.pixels;
    double maxScrollLength = _scrollController.position.maxScrollExtent;

    if (currentPosition >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<NewestBooksCubit>(context)
            .fetchNewestBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }
}
