import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/news/data/datasource/news_remote_datasource.dart';
import '../../features/news/data/repositories/news_repository_impl.dart';
import '../../features/news/domain/repositories/news_repository.dart';
import '../../features/news/presentation/bloc/news_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerLazySingleton<Dio>(
    () => Dio(),
  );

  sl.registerLazySingleton<NewsRemoteDatasource>(
    () => NewsRemoteDatasource(
      sl<Dio>(),
    ),
  );

  sl.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      sl<NewsRemoteDatasource>(),
    ),
  );

  sl.registerFactory<NewsCubit>(
    () => NewsCubit(
      sl<NewsRepository>(),
    ),
  );

}