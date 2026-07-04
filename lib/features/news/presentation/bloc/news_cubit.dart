import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/news_repository.dart';

import 'news_state.dart';

class NewsCubit extends Cubit<NewsState>{

final NewsRepository repository;

NewsCubit(this.repository)

: super(NewsLoading());

Future<void> fetchNews()

async{

emit(NewsLoading());

try{

final articles =

await repository.getNews();

emit(

NewsLoaded(articles)

);

}

catch(e){

emit(

NewsError(

e.toString()

)

);

}

}

}