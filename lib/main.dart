import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapp/presentation/router/app_router.dart';

import 'data/data_sources/category_api.dart';
import 'data/data_sources/questions_api.dart';
import 'data/repositories/category_repository.dart';
import 'data/repositories/questions_repository.dart';
import 'logic/bloc/question_page/question_page_bloc.dart';
import 'logic/bloc/score/score_bloc.dart';
import 'logic/cubit/category_cubit/category_cubit.dart';
import 'logic/cubit/difficulty_cubit/difficulty_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                CategoryCubit(CategoryRepository(categoryApi: CategoryApi()))
                  ..getCategories()),
        BlocProvider(create: (context) => DifficultyCubit()),
        BlocProvider(
            create: (context) => QuestionPageBloc(
                QuestionsRepository(questionsApi: QuestionsApi()))),
        BlocProvider(create: (context) => ScoreBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Dosis',
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              background: const Color(0xffFCFAFF)),
          useMaterial3: true,
        ),
        routerConfig: appRouter,
      ),
    );
  }
}
