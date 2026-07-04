import 'package:go_router/go_router.dart';

import '../../features/news/presentation/pages/home_page.dart';

final router = GoRouter(

routes: [

GoRoute(

path: '/',

builder: (context,state){

return HomePage();

}

)

]

);