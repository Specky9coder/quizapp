import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/category_model.dart';
import '../view/difficulty_page.dart';
import '../view/home_page.dart';
import '../view/question_page.dart';
import '../view/score_details_page.dart';
import '../view/score_page.dart';


final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: 'home-page',
    pageBuilder: (context, state) {
      return const MaterialPage(child: HomePage());
    },
  ),
  GoRoute(
    path: '/difficulty-page',
    name: 'difficulty-page',
    pageBuilder: (context, state) {
      final category = state.extra as QuizCategory;

      return MaterialPage(
          child: DifficultyPage(
        category: category,
      ));
    },
  ),
  GoRoute(
    name: 'question-page',
    path: '/question-page',
    pageBuilder: (context, state) {
      final category = state.extra as QuizCategory;

      return MaterialPage(
          child: QuestionPage(
        category: category,
      ));
    },
  ),
  GoRoute(
    name: 'score-page',
    path: '/score-page',
    pageBuilder: (context, state) {
      return const MaterialPage(child: ScorePage());
    },
  ),
  GoRoute(
    name: 'score-details-page',
    path: '/score-details-page',
    pageBuilder: (context, state) {
      return const MaterialPage(child: ScoreDetailsPage());
    },
  ),
]);
