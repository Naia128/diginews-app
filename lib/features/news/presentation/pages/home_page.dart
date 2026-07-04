import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/news_cubit.dart';
import '../bloc/news_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "DigiNews",
        ),
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is NewsLoaded) {
            return ListView.builder(
              itemCount: state.articles.length,

              itemBuilder: (context, index) {

                final article =
                    state.articles[index];

                return ListTile(

                  title:
                      Text(article.title),

                  subtitle:
                      Text(
                    article.summary,
                    maxLines: 2,
                  ),

                );

              },
            );
          }

          if (state is NewsError) {
            return Center(
              child: Text(
                state.message,
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}