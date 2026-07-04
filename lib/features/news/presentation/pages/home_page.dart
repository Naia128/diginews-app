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
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,

        elevation: 2,

      ),

      body: BlocBuilder<NewsCubit, NewsState>(

        builder: (context, state) {

          if (state is NewsLoading) {

            return const Center(

              child:
                  CircularProgressIndicator(),

            );

          }

          if (state is NewsLoaded) {

            return ListView.builder(

              padding:
                  const EdgeInsets.all(12),

              itemCount:
                  state.articles.length,

              itemBuilder:

                  (context, index) {

                final article =
                    state.articles[index];

                return Card(

                  margin:
                      const EdgeInsets.only(

                    bottom: 16,

                  ),

                  elevation: 4,

                  shape:
                      RoundedRectangleBorder(

                    borderRadius:
                        BorderRadius.circular(

                      16,

                    ),

                  ),

                  child: Padding(

                    padding:
                        const EdgeInsets.all(

                      16,

                    ),

                    child: Column(

                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,

                      children: [

                        Text(

                          article.title,

                          style:
                              const TextStyle(

                            fontSize: 18,

                            fontWeight:
                                FontWeight.bold,

                          ),

                          maxLines: 2,

                          overflow:
                              TextOverflow
                                  .ellipsis,

                        ),

                        const SizedBox(

                          height: 12,

                        ),

                        Text(

                          article.summary,

                          style: TextStyle(

                            color:
                                Colors.grey[700],

                            height: 1.4,

                          ),

                          maxLines: 3,

                          overflow:
                              TextOverflow
                                  .ellipsis,

                        ),

                      ],

                    ),

                  ),

                );

              },

            );

          }

          if (state is NewsError) {

            return Center(

              child: Column(

                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  const Icon(

                    Icons.error_outline,

                    size: 60,

                    color: Colors.red,

                  ),

                  const SizedBox(

                    height: 12,

                  ),

                  Text(

                    state.message,

                    textAlign:
                        TextAlign.center,

                  ),

                ],

              ),

            );

          }

          return const Center(

            child: Text(

              "Belum ada berita",

            ),

          );

        },

      ),

    );

  }
}