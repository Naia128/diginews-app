import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/news/data/datasource/news_remote_datasource.dart';
import '../../features/news/data/repositories/news_repository_impl.dart';
import '../../features/news/domain/repositories/news_repository.dart';
import '../../features/news/presentation/bloc/news_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {

  // Dio
  sl.registerLazySingleton<Dio>(
    () => Dio(),
  );

  // Datasource
  sl.registerLazySingleton<NewsRemoteDatasource>(
    () => NewsRemoteDatasource(
      sl<Dio>(),
    ),
  );

  // Repository
  sl.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      sl<NewsRemoteDatasource>(),
    ),
  );

  // Cubit
  sl.registerFactory<NewsCubit>(
    () => NewsCubit(
      sl<NewsRepository>(),
    ),
  );

}