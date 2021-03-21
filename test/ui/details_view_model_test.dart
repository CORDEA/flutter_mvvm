import 'package:flutter_mvvm/response/question.dart';
import 'package:flutter_mvvm/ui/details_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'details_view_model_test.mocks.dart';

@GenerateMocks([Question, Owner])
void main() {
  late MockQuestion question;
  late MockOwner owner;

  setUp(() {
    question = MockQuestion();
    owner = MockOwner();
  });

  test('Build', () {
    // given
    when(question.title).thenReturn('title');
    when(owner.displayName).thenReturn('displayName');
    when(question.owner).thenReturn(owner);

    // when
    final viewModel = DetailsViewModel(question);

    // then
    expect(viewModel.title, 'title');
    expect(viewModel.displayName, 'displayName');
  });

  test('onFabTapped', () async {
    // given
    when(question.title).thenReturn('title');
    when(question.link).thenReturn('link');
    when(owner.displayName).thenReturn('displayName');
    when(question.owner).thenReturn(owner);

    // when
    final viewModel = DetailsViewModel(question);
    viewModel.onFabTapped();

    // then
    await expectLater(
      viewModel.event,
      emits((event) => (event as OpenUrl).link == 'link'),
    );
  });
}
