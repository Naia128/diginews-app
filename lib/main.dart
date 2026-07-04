import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/dependency_injection/injector.dart';

import 'core/router/app_router.dart';

import 'features/news/presentation/bloc/news_cubit.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(
    const MyApp(),
  );

}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(

      create:

          (_) =>

              sl<NewsCubit>()

                ..fetchNews(),

      child:

          MaterialApp.router(

        debugShowCheckedModeBanner:

            false,

        routerConfig: router,

      ),

    );

  }

}