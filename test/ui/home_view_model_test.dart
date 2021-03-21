import 'dart:async';

import 'package:flutter_mvvm/repository/question.dart';
import 'package:flutter_mvvm/response/question.dart';
import 'package:flutter_mvvm/ui/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_view_model_test.mocks.dart';

@GenerateMocks([QuestionRepository])
void main() {
  late MockQuestionRepository repository;
  late HomeViewModel viewModel;

  setUp(() {
    repository = MockQuestionRepository();
    viewModel = HomeViewModel(repository);
  });

  test('fetch - success', () async {
    // given
    when(repository.findAll()).thenAnswer(
      (_) => Future.value(
        [
          Question([], Owner('displayName'), 'link', 'title'),
          Question([], Owner('displayName'), 'link', 'title'),
          Question([], Owner('displayName'), 'link', 'title'),
          Question([], Owner('displayName'), 'link', 'title'),
        ],
      ),
    );
    final completer = Completer();
    final listener = () => completer.complete();
    viewModel.addListener(listener);

    // when
    viewModel.fetch();

    // then
    await completer.future;
    expect(viewModel.questions.length, 4);
    expectLater(viewModel.event, emitsInOrder([]));

    viewModel.removeListener(listener);
  });

  test('fetch - error', () async {
    // given
    when(repository.findAll()).thenAnswer(
      (_) => Future.error(Error()),
    );

    // when
    viewModel.fetch();

    // then
    expectLater(
      viewModel.event,
      emits(isA<ShowFetchErrorSnackBar>()),
    );
  });

  test('onItemTapped', () async {
    // given
    when(repository.findAll()).thenAnswer(
      (_) => Future.value(
        [
          Question([], Owner(''), '', ''),
          Question([], Owner('displayName'), 'link', 'title'),
        ],
      ),
    );
    final completer = Completer();
    final listener = () => completer.complete();
    viewModel.addListener(listener);

    // when
    viewModel.fetch();
    await completer.future;
    viewModel.onItemTapped(1);

    // then
    expect(viewModel.questions.length, 2);
    expectLater(
      viewModel.event,
      emits((event) => (event as NavigateToDetails).question.title == 'title'),
    );

    viewModel.removeListener(listener);
  });

  test('onRetried', () async {
    // given
    when(repository.findAll()).thenAnswer(
      (_) => Future.value(
        [
          Question([], Owner('displayName'), 'link', 'title'),
        ],
      ),
    );
    final completer = Completer();
    final listener = () => completer.complete();
    viewModel.addListener(listener);

    // when
    viewModel.onRetried();

    // then
    await completer.future;
    expect(viewModel.questions.length, 1);
    expectLater(viewModel.event, emitsInOrder([]));

    viewModel.removeListener(listener);
  });
}
