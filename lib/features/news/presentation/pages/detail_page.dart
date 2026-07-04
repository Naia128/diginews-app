import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  final dynamic article;

  const DetailPage({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Detail Berita"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Text(

              article.title,

              style: const TextStyle(

                fontSize: 24,

                fontWeight:
                    FontWeight.bold,

              ),

            ),

            const SizedBox(
              height: 16,
            ),

            Text(

              article.summary ??
                  article.description ??
                  "",

              style: const TextStyle(

                fontSize: 16,

              ),

            ),

          ],

        ),

      ),

    );

  }

}